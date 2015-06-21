var fs = require('fs');
var async = require('async');
var SerialPort = require("serialport").SerialPort
var serialPort = new SerialPort("/dev/tty.usbmodem1411", {
  baudrate: 9600
}, false); // this is the openImmediately flag [default is true]

var luaFile = process.argv[2];
var executeFile = process.argv[3] === 'true';
var scionLua = fs.readFileSync(luaFile,'utf8');

serialPort.open(function (error) {
  if ( error ) {
    console.log('failed to open: '+error);
  } else {
    console.log('open');
    serialPort.on('data', function(data) {
      console.log('data received: ' + data);
    });    
    var currentCb, currentStr;
    async.eachSeries(
      [
        'file.remove("' + luaFile + '")',
        'file.close()',
        'file.open("' + luaFile + '", "w")',
        'file.close()',
        'file.remove("' + luaFile + '")',
        'file.open("' + luaFile + '", "w+")',
      ].concat(
        scionLua.split('\n').map(function(s){
          return 'file.writeline([=[' + s + ']=])';
        })
      ).concat([
        'file.flush()',
        'file.close()'
      ].concat(
        executeFile ? [ 'dofile("' + luaFile + '")' ] : []
      ))
    ,function(s,cb){
      currentCb = cb, currentStr = s + '\n';
      console.log('writing line',currentStr, currentStr.length);
        
      serialPort.write(currentStr, function(err, results) {
        if(err) throw err;
        if(results !== currentStr.length) throw new Error('Result length does not match length of string entered: expected ' + currentStr.length + ', received ' + results);
        serialPort.flush();   //magic flush
        setTimeout(cb,200);   //magic timeout
      });
    },function(){
      console.log('done uploading to node');
      serialPort.flush();
      setTimeout(function(){
        serialPort.close();
      },2000);   //magic timeout
    });
  }
});

