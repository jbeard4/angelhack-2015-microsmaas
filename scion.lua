

return function (_ENV, _module)
local exports, module = _module.exports, _module;


local _regex0 = _regexp(" +", "");
local _regex1 = _regexp("\\.", "g");
local _regex2 = _regexp([[
\\b((?:[a-z][\\w-]+:(?:\\/{1,3}|[a-z0-9%])|www\\d{0,3}[.]|
[a-z0-9.\\-]+[.][a-z]{2,4}\\/)(?:[^\\s()<>]+|
\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\))+(?:\\(([^\\s()<>]+|
(\\([^\\s()<>]+\\)))*\\)|
[^\\s`!()\\[\\]{};:'\".,<>?]))]], "i");
--[[731]] (function (this, root, factory)
--[[763]] if (((_typeof(exports)))==(("object"))) then
--[[956]] module.exports = factory(_global);
else
if (((((_typeof(define)))==(("function"))))and(define.amd)) then
--[[1102]] define(_global, factory);
else
--[[1184]] root.scion = factory(_global);
end;
end;
end)(_global, this, (function (this)
local STATE__TYPES, ioProcessorTypes, eventProcessorTypes, initializeModel,
ArraySet, scxmlPrefixTransitionSelector, query,
getTransitionWithHigherSourceChildPriority, initializeModelGeneratorFn,
deserializeSerializedConfiguration, deserializeHistory, printTrace,
BaseInterpreter, Statechart, beget, InterpreterScriptingContext,
validateUriRegex = STATE__TYPES, ioProcessorTypes, eventProcessorTypes,
initializeModel, ArraySet, scxmlPrefixTransitionSelector, query,
getTransitionWithHigherSourceChildPriority, initializeModelGeneratorFn,
deserializeSerializedConfiguration, deserializeHistory, printTrace,
BaseInterpreter, Statechart, beget, InterpreterScriptingContext,
validateUriRegex;
initializeModel = (function () local initializeModel = nil; initializeModel = function (this, rootState)
local transitions, idToStateMap, documentOrder, idCount, generateId,
wrapInFakeRootState, normalizeAction, statesWithInitialAttributes, traverse,
checkInitialRef, connectIntialAttributes, connectTransitionGraph, getScope,
getLCCA, fakeRootState = transitions, idToStateMap, documentOrder, idCount,
generateId, wrapInFakeRootState, normalizeAction, statesWithInitialAttributes,
traverse, checkInitialRef, connectIntialAttributes, connectTransitionGraph,
getScope, getLCCA, fakeRootState;
generateId = (function () local generateId = nil; generateId = function (this, type)
local count = count;
--[[2183]] if ((idCount[type])==(undefined)) then
idCount[type] = (0);
end;
--[[2247]] count = (function () local _r = idCount[type]; idCount[type] = _r + 1; return _r; end)(); 
--[[2288]] if true then return ((((((("$generated-"))+(type)))+(("-"))))+(count)); end
end; generateId:__defineGetter__("name", function () return "generateId"; end); return generateId; end)();

wrapInFakeRootState = (function () local wrapInFakeRootState = nil; wrapInFakeRootState = function (this, state)
--[[2400]] if true then return _obj({
  ["$deserializeDatamodel"]=((state["$deserializeDatamodel"])or((function (this)

end))),
  ["$serializeDatamodel"]=((state["$serializeDatamodel"])or((function (this)
--[[2573]] if true then return (null); end
end))),
  ["$idToStateMap"]=idToStateMap,
  ["states"]=_arr({[0]=_obj({
  ["$type"]=("initial"),
  ["transitions"]=_arr({[0]=_obj({
  ["target"]=state
})}, 1)
}), state}, 2)
}); end
end; wrapInFakeRootState:__defineGetter__("name", function () return "wrapInFakeRootState"; end); return wrapInFakeRootState; end)();

normalizeAction = (function () local normalizeAction = nil; normalizeAction = function (this, stateOrTransition, actionProperty)
local v, normalize = v, normalize;
normalize = (function () local normalize = nil; normalize = function (this, o)
--[[3173]] if (((_typeof(o)))==(("string"))) then
--[[3220]] if true then return eval(_global, o); end
else
if (((_typeof(o)))==(("function"))) then
--[[3339]] if true then return o; end
else
--[[3392]] _error(_new(Error, ((("Unrecognized type of object for actionProperty "))+(actionProperty))) or {})
end;
end;
end; normalize:__defineGetter__("name", function () return "normalize"; end); return normalize; end)();
--[[3078]] v = stateOrTransition[actionProperty]; 
--[[3134]] 
--[[3522]] if ((v)~=(undefined)) then
stateOrTransition[actionProperty] = ((Array:isArray(v)) and {v:map(normalize)} or {_arr({[0]=normalize(_global, v)}, 1)})[1];
end;
end; normalizeAction:__defineGetter__("name", function () return "normalizeAction"; end); return normalizeAction; end)();

traverse = (function () local traverse = nil; traverse = function (this, ancestors, state)
local t2, initialChildren, historyChildren = t2, initialChildren, historyChildren;
--[[3808]] if state.transitions then
transitions.push:apply(transitions, state.transitions);
end;
--[[3934]] if state.id then
--[[3964]] if idToStateMap[state.id] then
_error(_new(Error, ((("Redefinition of state id "))+(state.id))) or {})
end;
--[[4065]] idToStateMap[state.id] = state;
end;
--[[4250]] state["$type"] = ((state["$type"])or(("state")));
--[[4350]] state.ancestors = ancestors;
--[[4391]] state.depth = ancestors.length;
--[[4435]] state.parent = ancestors[(0)];
--[[4527]] state.transitions = ((state.transitions)or(_arr({}, 0)));
--[[4584]] state.transitions:forEach((function (this, transition)
--[[4648]] transition.documentOrder = (function () local _r = documentOrder; documentOrder = _r + 1; return _r; end)();
--[[4709]] transition.source = state;
end));
--[[4765]] t2 = traverse:bind((null), _arr({[0]=state}, 1):concat(ancestors)); 
--[[4863]] if state.states then
state.states:forEach(t2);
end;
--[[4955]] repeat
local _0 = ("parallel"); local _1 = ("initial"); local _2 = ("history"); local _3 = ("final"); local _4 = ("state"); local _5 = ("scxml"); local _6;
local _r = state["$type"];
if _r == _0 then
state.typeEnum = STATE__TYPES.PARALLEL;
if true then break; end;
end
if _r == _1 then
state.typeEnum = STATE__TYPES.INITIAL;
if true then break; end;
end
if _r == _2 then
state.typeEnum = STATE__TYPES.HISTORY;
if true then break; end;
end
if _r == _3 then
state.typeEnum = STATE__TYPES.FINAL;
if true then break; end;
end
if _r == _4 then

_r = _5;
end
if _r == _5 then
if ((state.states)and(state.states.length)) then
--[[5595]] state.typeEnum = STATE__TYPES.COMPOSITE;
else
--[[5686]] state.typeEnum = STATE__TYPES.BASIC;
end;
if true then break; end;
end
_error(_new(Error, ((("Unknown state type: "))+(state["$type"]))) or {})
until true
--[[5997]] if state.states then
--[[6031]] state.descendants = state.states:concat(state.states:map((function (this, s)
--[[6100]] if true then return s.descendants; end
end)):reduce((function (this, a, b)
--[[6145]] if true then return a:concat(b); end
end), _arr({}, 0)));
else
--[[6207]] state.descendants = _arr({}, 0);
end;
--[[6258]] initialChildren = nil; 
--[[6291]] if ((state.typeEnum)==(STATE__TYPES.COMPOSITE)) then
--[[6409]] if (((_typeof(state.initial)))==(("string"))) then
--[[6468]] statesWithInitialAttributes:push(state);
else
--[[6633]] initialChildren = state.states:filter((function (this, child)
--[[6712]] if true then return ((child["$type"])==(("initial"))); end
end));
--[[6791]] state.initialRef = ((initialChildren.length) and {initialChildren[(0)]} or {state.states[(0)]})[1];
--[[6893]] checkInitialRef(_global, state);
end;
end;
--[[6993]] if ((((state.typeEnum)==(STATE__TYPES.COMPOSITE)))or(((state.typeEnum)==(STATE__TYPES.PARALLEL)))) then
--[[7119]] historyChildren = state.states:filter((function (this, s)
--[[7194]] if true then return ((s["$type"])==(("history"))); end
end)); 
--[[7261]] state.historyRef = historyChildren[(0)];
end;
--[[7381]] if (not (state.id)) then
--[[7412]] state.id = generateId(_global, state["$type"]);
--[[7464]] idToStateMap[state.id] = state;
end;
--[[7595]] _arr({[0]=("onEntry"), ("onExit")}, 2):forEach(normalizeAction:bind(this, state));
end; traverse:__defineGetter__("name", function () return "traverse"; end); return traverse; end)();

checkInitialRef = (function () local checkInitialRef = nil; checkInitialRef = function (this, state)
--[[7787]] if (not (state.initialRef)) then
_error(_new(Error, ((("Unable to locate initial state for composite state: "))+(state.id))) or {})
end;
end; checkInitialRef:__defineGetter__("name", function () return "checkInitialRef"; end); return checkInitialRef; end)();

connectIntialAttributes = (function () local connectIntialAttributes = nil; connectIntialAttributes = function (this)
--[[7957]] statesWithInitialAttributes:forEach((function (this, state)
--[[8022]] state.initialRef = idToStateMap[state.initial];
--[[8082]] checkInitialRef(_global, state);
end));
end; connectIntialAttributes:__defineGetter__("name", function () return "connectIntialAttributes"; end); return connectIntialAttributes; end)();

connectTransitionGraph = (function () local connectTransitionGraph = nil; connectTransitionGraph = function (this)
--[[8233]] transitions:forEach((function (this, t)
--[[8281]] normalizeAction(_global, t, ("onTransition"));
end));
--[[8345]] transitions:forEach((function (this, t)
--[[8464]] if t.event then
--[[8497]] t.events = t.event:trim():split(_regex0);
end;
end));
--[[8613]] transitions:forEach((function (this, t)
local target = target;
--[[8662]] if ((t.targets)or((((_typeof(t.target)))==(("undefined"))))) then
if true then return ; end
end;
--[[8775]] if (((_typeof(t.target)))==(("string"))) then
--[[8873]] target = idToStateMap[t.target]; 
--[[8930]] if (not (target)) then
_error(_new(Error, ((("Unable to find target state with id "))+(t.target))) or {})
end;
--[[9030]] t.target = target;
--[[9069]] t.targets = _arr({[0]=t.target}, 1);
else
if Array:isArray(t.target) then
--[[9208]] t.targets = t.target:map((function (this, target)
--[[9275]] if (((_typeof(target)))==(("string"))) then
--[[9335]] target = idToStateMap[target];
--[[9394]] if (not (target)) then
_error(_new(Error, ((("Unable to find target state with id "))+(t.target))) or {})
end;
--[[9502]] if true then return target; end
else
--[[9576]] if true then return target; end
end;
end));
else
if (((_typeof(t.target)))==(("object"))) then
--[[9719]] t.targets = _arr({[0]=t.target}, 1);
else
--[[9786]] _error(_new(Error, ((("Transition target has unknown type: "))+(t.target))) or {})
end;
end;
end;
end));
--[[9942]] transitions:forEach((function (this, t)
--[[9991]] if t.targets then
t.lcca = getLCCA(_global, t.source, t.targets[(0)]);
end;
--[[10165]] t.scope = getScope(_global, t);
end));
end; connectTransitionGraph:__defineGetter__("name", function () return "connectTransitionGraph"; end); return connectTransitionGraph; end)();

getScope = (function () local getScope = nil; getScope = function (this, transition)
local transitionIsReallyInternal = transitionIsReallyInternal;
--[[10501]] transitionIsReallyInternal = ((((((((transition.type)==(("internal"))))and(transition.source.parent)))and(transition.targets)))and(transition.targets:every((function (this, target)
--[[10870]] if true then return ((transition.source.descendants:indexOf(target))>((-((1))))); end
end)))); 
--[[10945]] if (not (transition.targets)) then
--[[10986]] if true then return transition.source; end
else
if transitionIsReallyInternal then
--[[11079]] if true then return transition.source; end
else
--[[11141]] if true then return transition.lcca; end
end;
end;
end; getScope:__defineGetter__("name", function () return "getScope"; end); return getScope; end)();

getLCCA = (function () local getLCCA = nil; getLCCA = function (this, s1, s2)
local commonAncestors = commonAncestors;
--[[11282]] commonAncestors = _arr({}, 0); 
--[[11320]] s1.ancestors:forEach((function (this, anc)
--[[11473]] if ((((anc.typeEnum)==(STATE__TYPES.COMPOSITE)))and(((anc.descendants:indexOf(s2))>((-((1))))))) then
--[[11593]] commonAncestors:push(anc);
end;
end));
--[[11771]] if (not (commonAncestors.length)) then
_error(_new(Error, ("Could not find LCA for states.")) or {})
end;
--[[11862]] if true then return commonAncestors[(0)]; end
end; getLCCA:__defineGetter__("name", function () return "getLCCA"; end); return getLCCA; end)();
--[[1915]] transitions = _arr({}, 0);  idToStateMap = _obj({
  
});  documentOrder = (0); 
--[[2117]] idCount = _obj({
  
}); 
--[[2144]] 
--[[2351]] 
--[[3006]] 
--[[3653]] statesWithInitialAttributes = _arr({}, 0); 
--[[3700]] 
--[[7744]] 
--[[7911]] 
--[[8139]] 
--[[10296]] 
--[[11198]] 
--[[12015]] fakeRootState = wrapInFakeRootState(_global, rootState); 
--[[12178]] traverse(_global, _arr({}, 0), fakeRootState);
--[[12214]] connectTransitionGraph(_global);
--[[12248]] connectIntialAttributes(_global);
--[[12284]] if true then return fakeRootState; end
end; initializeModel:__defineGetter__("name", function () return "initializeModel"; end); return initializeModel; end)();

ArraySet = (function () local ArraySet = nil; ArraySet = function (this, l)
--[[12399]] l = ((l)or(_arr({}, 0)));
--[[12420]] this.o = _arr({}, 0);
--[[12454]] l:forEach((function (this, x)
--[[12489]] this:add(x);
end), this);
end; ArraySet:__defineGetter__("name", function () return "ArraySet"; end); return ArraySet; end)();

getTransitionWithHigherSourceChildPriority = (function () local getTransitionWithHigherSourceChildPriority = nil; getTransitionWithHigherSourceChildPriority = function (this, __arg)
local t1, t2 = t1, t2;
--[[16545]] t1 = __arg[(0)];  t2 = __arg[(1)]; 
--[[16666]] if ((t1.source.depth)<(t2.source.depth)) then
--[[16719]] if true then return t2; end
else
if ((t2.source.depth)<(t1.source.depth)) then
--[[16798]] if true then return t1; end
else
--[[16838]] if ((t1.documentOrder)<(t2.documentOrder)) then
--[[16897]] if true then return t1; end
else
--[[16945]] if true then return t2; end
end;
end;
end;
end; getTransitionWithHigherSourceChildPriority:__defineGetter__("name", function () return "getTransitionWithHigherSourceChildPriority"; end); return getTransitionWithHigherSourceChildPriority; end)();

initializeModelGeneratorFn = (function () local initializeModelGeneratorFn = nil; initializeModelGeneratorFn = function (this, modelFn, opts, interpreter)
local args = args;
--[[17066]] opts.x = ((opts.x)or(_obj({
  
})));
--[[17099]] args = _arr({[0]=("x"), ("sessionid"), ("ioprocessors")}, 3):map((function (this, name)
--[[17192]] if true then return (function () local _r =  opts[name]; opts.x[((("_"))+(name))]  = _r; return _r; end)(); end
end)):concat(interpreter.isIn:bind(interpreter)); 
--[[17411]] if true then return modelFn:apply(interpreter, args); end
end; initializeModelGeneratorFn:__defineGetter__("name", function () return "initializeModelGeneratorFn"; end); return initializeModelGeneratorFn; end)();

deserializeSerializedConfiguration = (function () local deserializeSerializedConfiguration = nil; deserializeSerializedConfiguration = function (this, serializedConfiguration, idToStateMap)
--[[17551]] if true then return serializedConfiguration:map((function (this, id)
local state = state;
--[[17608]] state = idToStateMap[id]; 
--[[17646]] if (not (state)) then
_error(_new(Error, ((("Error loading serialized configuration. Unable to locate state with id "))+(id))) or {})
end;
--[[17762]] if true then return state; end
end)); end
end; deserializeSerializedConfiguration:__defineGetter__("name", function () return "deserializeSerializedConfiguration"; end); return deserializeSerializedConfiguration; end)();

deserializeHistory = (function () local deserializeHistory = nil; deserializeHistory = function (this, serializedHistory, idToStateMap)
local o = o;
--[[17864]] o = _obj({
  
}); 
--[[17882]] Object:keys(serializedHistory):forEach((function (this, sid)
--[[17944]] o[sid] = serializedHistory[sid]:map((function (this, id)
local state = state;
--[[18004]] state = idToStateMap[id]; 
--[[18044]] if (not (state)) then
_error(_new(Error, ((("Error loading serialized history. Unable to locate state with id "))+(id))) or {})
end;
--[[18156]] if true then return state; end
end));
end));
--[[18198]] if true then return o; end
end; deserializeHistory:__defineGetter__("name", function () return "deserializeHistory"; end); return deserializeHistory; end)();

BaseInterpreter = (function () local BaseInterpreter = nil; BaseInterpreter = function (this, modelOrFnGenerator, opts)
local model = model;
--[[18352]] this["_scriptingContext"] = ((opts.interpreterScriptingContext)or(((opts.InterpreterScriptingContext) and {_new(opts.InterpreterScriptingContext, this)} or {_obj({
  
})})[1]));
--[[18509]] model = nil; 
--[[18528]] if (((_typeof(modelOrFnGenerator)))==(("function"))) then
--[[18586]] model = initializeModelGeneratorFn(_global, modelOrFnGenerator, opts, this);
else
if (((_typeof(modelOrFnGenerator)))==(("string"))) then
--[[18724]] model = JSON:parse(modelOrFnGenerator);
else
--[[18791]] model = modelOrFnGenerator;
end;
end;
--[[18838]] this["_model"] = initializeModel(_global, model);
--[[18962]] this.opts = ((opts)or(_obj({
  
})));
--[[18995]] this.opts.console = ((opts.console)or((((((_typeof(console)))==(("undefined")))) and {_obj({
  ["log"]=(function (this)

end)
})} or {console})[1]));
--[[19162]] this.opts.Set = ((this.opts.Set)or(ArraySet));
--[[19213]] this.opts.priorityComparisonFn = ((this.opts.priorityComparisonFn)or(getTransitionWithHigherSourceChildPriority));
--[[19332]] this.opts.transitionSelector = ((this.opts.transitionSelector)or(scxmlPrefixTransitionSelector));
--[[19435]] this["_scriptingContext"].log = ((this["_scriptingContext"].log)or(this.opts.console.log));
--[[19576]] this["_internalEventQueue"] = _arr({}, 0);
--[[19674]] if opts.snapshot then
--[[19703]] this["_configuration"] = _new(this.opts.Set, deserializeSerializedConfiguration(_global, opts.snapshot[(0)], this["_model"]["$idToStateMap"]));
--[[19835]] this["_historyValue"] = deserializeHistory(_global, opts.snapshot[(1)], this["_model"]["$idToStateMap"]);
--[[19932]] this["_isInFinalState"] = opts.snapshot[(2)];
--[[19983]] (function () local _b = this["_model"]; local _f = _b["$deserializeDatamodel"]; return _f(_b, opts.snapshot[(3)]); end)();
else
--[[20087]] this["_configuration"] = _new(this.opts.Set);
--[[20140]] this["_historyValue"] = _obj({
  
});
--[[20175]] this["_isInFinalState"] = (false);
end;
--[[20258]] this["_x"] = _obj({
  ["_sessionId"]=((opts.sessionId)or((null))),
  ["_name"]=((((model.name)or(opts.name)))or((null))),
  ["_ioprocessors"]=((opts.ioprocessors)or((null)))
});
--[[20446]] this["_listeners"] = _arr({}, 0);
end; BaseInterpreter:__defineGetter__("name", function () return "BaseInterpreter"; end); return BaseInterpreter; end)();

Statechart = (function () local Statechart = nil; Statechart = function (this, model, opts)
--[[41661]] opts = ((opts)or(_obj({
  
})));
--[[41689]] opts.ioprocessors = _obj({
  
});
--[[41845]] Object:keys(ioProcessorTypes):forEach((function (this, processor)
--[[41916]] opts.ioprocessors[processor] = ioProcessorTypes[processor];
end));
--[[41997]] opts.InterpreterScriptingContext = ((opts.InterpreterScriptingContext)or(InterpreterScriptingContext));
--[[42106]] this["_isStepping"] = (false);
--[[42141]] BaseInterpreter:call(this, model, opts);
end; Statechart:__defineGetter__("name", function () return "Statechart"; end); return Statechart; end)();

beget = (function () local beget = nil; beget = function (this, o)
local F = F;
F = (function () local F = nil; F = function (this)

end; F:__defineGetter__("name", function () return "F"; end); return F; end)();
--[[42247]] 
--[[42270]] F.prototype = o;
--[[42295]] if true then return _new(F); end
end; beget:__defineGetter__("name", function () return "beget"; end); return beget; end)();

InterpreterScriptingContext = (function () local InterpreterScriptingContext = nil; InterpreterScriptingContext = function (this, interpreter)
--[[43589]] this["_interpreter"] = interpreter;
--[[43630]] this["_timeoutMap"] = _obj({
  
});
end; InterpreterScriptingContext:__defineGetter__("name", function () return "InterpreterScriptingContext"; end); return InterpreterScriptingContext; end)();
--[[1239]] if ("use strict") then end;
--[[1258]] STATE__TYPES = _obj({
  ["BASIC"]=(0),
  ["COMPOSITE"]=(1),
  ["PARALLEL"]=(2),
  ["HISTORY"]=(3),
  ["INITIAL"]=(4),
  ["FINAL"]=(5)
}); 
--[[1408]] ioProcessorTypes = _obj({
  [("scxml")]=_obj({
  ["location"]=("http://www.w3.org/TR/scxml/#SCXMLEventProcessor")
}),
  [("basichttp")]=_obj({
  ["location"]=("http://www.w3.org/TR/scxml/#BasicHTTPEventProcessor")
}),
  [("dom")]=_obj({
  ["location"]=("http://www.w3.org/TR/scxml/#DOMEventProcessor")
})
}); 
--[[1754]] eventProcessorTypes = Object:keys(ioProcessorTypes):map((function (this, k)
--[[1826]] if true then return ioProcessorTypes[k].location; end
end)); 
--[[1870]] 
--[[12368]] 
--[[12530]] ArraySet.prototype = _obj({
  ["add"]=(function (this, x)
--[[12594]] if (not (this:contains(x))) then
if true then return this.o:push(x); end
end;
end),
  ["remove"]=(function (this, x)
local i = i;
--[[12695]] i = this.o:indexOf(x); 
--[[12734]] if ((i)==((-((1))))) then
--[[12764]] if true then return (false); end
else
--[[12813]] this.o:splice(i, (1));
end;
--[[12860]] if true then return (true); end
end),
  ["union"]=(function (this, l)
--[[12927]] l = ((l.iter) and {l:iter()} or {l})[1];
--[[12966]] l:forEach((function (this, x)
--[[13005]] this:add(x);
end), this);
--[[13051]] if true then return this; end
end),
  ["difference"]=(function (this, l)
--[[13123]] l = ((l.iter) and {l:iter()} or {l})[1];
--[[13163]] l:forEach((function (this, x)
--[[13202]] this:remove(x);
end), this);
--[[13251]] if true then return this; end
end),
  ["contains"]=(function (this, x)
--[[13321]] if true then return ((this.o:indexOf(x))>((-((1))))); end
end),
  ["iter"]=(function (this)
--[[13404]] if true then return this.o; end
end),
  ["isEmpty"]=(function (this)
--[[13474]] if true then return (not (this.o.length)); end
end),
  ["equals"]=(function (this, s2)
local l2, l1 = l2, l1;
--[[13553]] l2 = s2:iter(); 
--[[13585]] l1 = this.o; 
--[[13615]] if true then return ((l1:every((function (this, x)
--[[13660]] if true then return ((l2:indexOf(x))>((-((1))))); end
end)))and(l2:every((function (this, x)
--[[13743]] if true then return ((l1:indexOf(x))>((-((1))))); end
end)))); end
end),
  ["toString"]=(function (this)
--[[13842]] if true then return ((((("Set("))+(this.o:toString())))+((")"))); end
end)
});
--[[13905]] scxmlPrefixTransitionSelector = (function (this)
local eventNameReCache, eventNameToRe, retrieveEventRe, nameMatch = eventNameReCache, eventNameToRe, retrieveEventRe, nameMatch;
eventNameToRe = (function () local eventNameToRe = nil; eventNameToRe = function (this, name)
--[[14042]] if true then return _new(RegExp, ((((("^"))+(name:replace(_regex1, ("\\.")))))+(("(\\.[0-9a-zA-Z]+)*$")))); end
end; eventNameToRe:__defineGetter__("name", function () return "eventNameToRe"; end); return eventNameToRe; end)();

retrieveEventRe = (function () local retrieveEventRe = nil; retrieveEventRe = function (this, name)
--[[14185]] if true then return ((eventNameReCache[name]) and {eventNameReCache[name]} or {(function () local _r =  eventNameToRe(_global, name); eventNameReCache[name]  = _r; return _r; end)()})[1]; end
end; retrieveEventRe:__defineGetter__("name", function () return "retrieveEventRe"; end); return retrieveEventRe; end)();

nameMatch = (function () local nameMatch = nil; nameMatch = function (this, t, event)
--[[14350]] if true then return ((((event)and(event.name)))and(((((t.events:indexOf(("*")))>((-((1)))))) and {(true)} or {t.events:filter((function (this, tEvent)
--[[14573]] if true then return retrieveEventRe(_global, tEvent):test(event.name); end
end)).length})[1])); end
end; nameMatch:__defineGetter__("name", function () return "nameMatch"; end); return nameMatch; end)();
--[[13963]] eventNameReCache = _obj({
  
}); 
--[[13999]] 
--[[14140]] 
--[[14307]] 
--[[14686]] if true then return (function (this, state, event, evaluator)
--[[14741]] if true then return state.transitions:filter((function (this, t)
--[[14802]] if true then return (((((not (t.events)))or(nameMatch(_global, t, event))))and((((not (t.cond)))or(evaluator(_global, t.cond))))); end
end)); end
end); end
end)(_global); 
--[[14951]] query = _obj({
  ["getAncestors"]=(function (this, s, root)
local ancestors, index, state = ancestors, index, state;
--[[15019]] ancestors = nil;  index = nil;  state = nil; 
--[[15060]] index = s.ancestors:indexOf(root);
--[[15107]] if ((index)>((-((1))))) then
--[[15141]] if true then return s.ancestors:slice((0), index); end
else
--[[15214]] if true then return s.ancestors; end
end;
end),
  ["getAncestorsOrSelf"]=(function (this, s, root)
--[[15348]] if true then return _arr({[0]=s}, 1):concat(this:getAncestors(s, root)); end
end),
  ["getDescendantsOrSelf"]=(function (this, s)
--[[15462]] if true then return _arr({[0]=s}, 1):concat(s.descendants); end
end),
  ["isOrthogonalTo"]=(function (this, s1, s2)
--[[15747]] if true then return (((not (this:isAncestrallyRelatedTo(s1, s2))))and(((this:getLCA(s1, s2).typeEnum)==(STATE__TYPES.PARALLEL)))); end
end),
  ["isAncestrallyRelatedTo"]=(function (this, s1, s2)
--[[16048]] if true then return ((((this:getAncestorsOrSelf(s2):indexOf(s1))>((-((1))))))or(((this:getAncestorsOrSelf(s1):indexOf(s2))>((-((1))))))); end
end),
  ["getLCA"]=(function (this, s1, s2)
local commonAncestors = commonAncestors;
--[[16236]] commonAncestors = this:getAncestors(s1):filter((function (this, a)
--[[16316]] if true then return ((a.descendants:indexOf(s2))>((-((1))))); end
end), this); 
--[[16388]] if true then return commonAncestors[(0)]; end
end)
}); 
--[[16477]] 
--[[16991]] 
--[[17462]] 
--[[17797]] 
--[[18238]] printTrace = (false); 
--[[18291]] 
--[[20479]] BaseInterpreter.prototype = _obj({
  ["start"]=(function (this)
--[[20683]] if printTrace then
this.opts.console:log(("performing initial big step"));
end;
--[[21110]] this["_configuration"]:add(this["_model"].initialRef);
--[[21175]] (function () local _b = this; local _f = _b["_performBigStep"]; return _f(_b); end)();
--[[21211]] if true then return this:getConfiguration(); end
end),
  ["getConfiguration"]=(function (this)
--[[21330]] if true then return this["_configuration"]:iter():map((function (this, s)
--[[21380]] if true then return s.id; end
end)); end
end),
  ["getFullConfiguration"]=(function (this)
--[[21487]] if true then return this["_configuration"]:iter():map((function (this, s)
--[[21559]] if true then return _arr({[0]=s}, 1):concat(query:getAncestors(s)); end
end), this):reduce((function (this, a, b)
--[[21650]] if true then return a:concat(b); end
end), _arr({}, 0)):map((function (this, s)
--[[21725]] if true then return s.id; end
end)):reduce((function (this, a, b)
--[[21782]] if true then return ((((a:indexOf(b))>((-((1)))))) and {a} or {a:concat(b)})[1]; end
end), _arr({}, 0)); end
end),
  ["isIn"]=(function (this, stateName)
--[[21924]] if true then return ((this:getFullConfiguration():indexOf(stateName))>((-((1))))); end
end),
  ["isFinal"]=(function (this, stateName)
--[[22071]] if true then return this["_isInFinalState"]; end
end),
  ["_performBigStep"]=(function (this, e)
local keepGoing, currentEvent, selectedTransitions = keepGoing, currentEvent, selectedTransitions;
--[[22188]] if e then
this["_internalEventQueue"]:push(e);
end;
--[[22241]] keepGoing = (true); 
--[[22275]] while keepGoing do 

--[[22311]] currentEvent = ((this["_internalEventQueue"]:shift())or((null))); 
--[[22388]] selectedTransitions = (function () local _b = this; local _f = _b["_performSmallStep"]; return _f(_b, currentEvent); end)(); 
--[[22468]] keepGoing = (not (selectedTransitions:isEmpty()));

end;
--[[22538]] this["_isInFinalState"] = this["_configuration"]:iter():every((function (this, s)
--[[22607]] if true then return ((s.typeEnum)==(STATE__TYPES.FINAL)); end
end));
end),
  ["_performSmallStep"]=(function (this, currentEvent)
local selectedTransitions, selectedTransitionsWithTargets, exitedTuple,
basicStatesExited, statesExited, enteredTuple, basicStatesEntered,
statesEntered, eventsToAddToInnerQueue, evaluateAction, sortedTransitions =
selectedTransitions, selectedTransitionsWithTargets, exitedTuple,
basicStatesExited, statesExited, enteredTuple, basicStatesEntered,
statesEntered, eventsToAddToInnerQueue, evaluateAction, sortedTransitions;
--[[22754]] if printTrace then
this.opts.console:log(("selecting transitions with currentEvent: "), currentEvent);
end;
--[[22865]] selectedTransitions = (function () local _b = this; local _f = _b["_selectTransitions"]; return _f(_b, currentEvent); end)(); 
--[[22943]] if printTrace then
this.opts.console:log(("selected transitions: "), selectedTransitions);
end;
--[[23042]] if (not (selectedTransitions:isEmpty())) then
--[[23097]] if printTrace then
this.opts.console:log(("sorted transitions: "), selectedTransitions);
end;
--[[23396]] selectedTransitionsWithTargets = _new(this.opts.Set, selectedTransitions:iter():filter((function (this, t)
--[[23497]] if true then return t.targets; end
end))); 
--[[23536]] exitedTuple = (function () local _b = this; local _f = _b["_getStatesExited"]; return _f(_b, selectedTransitionsWithTargets); end)();  basicStatesExited = exitedTuple[(0)];  statesExited = exitedTuple[(1)]; 
--[[23735]] enteredTuple = (function () local _b = this; local _f = _b["_getStatesEntered"]; return _f(_b, selectedTransitionsWithTargets); end)();  basicStatesEntered = enteredTuple[(0)];  statesEntered = enteredTuple[(1)]; 
--[[23940]] if printTrace then
this.opts.console:log(("basicStatesExited "), basicStatesExited);
end;
--[[24036]] if printTrace then
this.opts.console:log(("basicStatesEntered "), basicStatesEntered);
end;
--[[24134]] if printTrace then
this.opts.console:log(("statesExited "), statesExited);
end;
--[[24220]] if printTrace then
this.opts.console:log(("statesEntered "), statesEntered);
end;
--[[24309]] eventsToAddToInnerQueue = _new(this.opts.Set); 
--[[24417]] if printTrace then
this.opts.console:log(("executing state exit actions"));
end;
--[[24505]] evaluateAction = this["_evaluateAction"]:bind(this, currentEvent); 
--[[24647]] statesExited:forEach((function (this, state)
local f = f;
--[[24706]] if ((printTrace)or(this.opts.logStatesEnteredAndExited)) then
this.opts.console:log(("exiting "), state.id);
end;
--[[24866]] this["_listeners"]:forEach((function (this, l)
--[[24926]] if l.onExit then
l:onExit(state.id);
end;
end));
--[[25005]] if ((state.onExit)~=(undefined)) then
state.onExit:forEach(evaluateAction);
end;
--[[25095]] f = nil; 
--[[25122]] if state.historyRef then
--[[25170]] if state.historyRef.isDeep then
--[[25229]] f = (function (this, s0)
--[[25280]] if true then return ((((s0.typeEnum)==(STATE__TYPES.BASIC)))and(((state.descendants:indexOf(s0))>((-((1))))))); end
end);
else
--[[25452]] f = (function (this, s0)
--[[25503]] if true then return ((s0.parent)==(state)); end
end);
end;
--[[25653]] this["_historyValue"][state.historyRef.id] = statesExited:filter(f);
end;
end), this);
--[[25927]] sortedTransitions = selectedTransitions:iter():sort((function (this, t1, t2)
--[[26022]] if true then return ((t1.documentOrder)-(t2.documentOrder)); end
end)); 
--[[26103]] if printTrace then
this.opts.console:log(("executing transitition actions"));
end;
--[[26194]] sortedTransitions:forEach((function (this, transition)
local targetIds = targetIds;
--[[26263]] targetIds = ((transition.targets)and(transition.targets:map((function (this, target)
--[[26341]] if true then return target.id; end
end)))); 
--[[26383]] this["_listeners"]:forEach((function (this, l)
--[[26443]] if l.onTransition then
l:onTransition(transition.source.id, targetIds);
end;
end));
--[[26556]] if ((transition.onTransition)~=(undefined)) then
transition.onTransition:forEach(evaluateAction);
end;
end), this);
--[[26694]] if printTrace then
this.opts.console:log(("executing state enter actions"));
end;
--[[26783]] statesEntered:forEach((function (this, state)
--[[26843]] if ((printTrace)or(this.opts.logStatesEnteredAndExited)) then
this.opts.console:log(("entering"), state.id);
end;
--[[26964]] this["_listeners"]:forEach((function (this, l)
--[[27024]] if l.onEntry then
l:onEntry(state.id);
end;
end));
--[[27105]] if ((state.onEntry)~=(undefined)) then
state.onEntry:forEach(evaluateAction);
end;
end), this);
--[[27218]] if printTrace then
this.opts.console:log(("updating configuration "));
end;
--[[27300]] if printTrace then
this.opts.console:log(("old configuration "), this["_configuration"]);
end;
--[[27503]] this["_configuration"]:difference(basicStatesExited);
--[[27570]] this["_configuration"]:union(basicStatesEntered);
--[[27635]] if printTrace then
this.opts.console:log(("new configuration "), this["_configuration"]);
end;
--[[27855]] if (not (eventsToAddToInnerQueue:isEmpty())) then
--[[27917]] if printTrace then
this.opts.console:log(("adding triggered events to inner queue "), eventsToAddToInnerQueue);
end;
--[[28044]] this["_internalEventQueue"]:push(eventsToAddToInnerQueue);
end;
end;
--[[28302]] if true then return selectedTransitions; end
end),
  ["_evaluateAction"]=(function (this, currentEvent, actionRef)
--[[28440]] local _e, _noreturn = nil, {}
local _s, _r = _xpcall(function ()
--[[28460]] if true then return actionRef:call(this["_scriptingContext"], currentEvent); end
      if true then return _noreturn; end
    end, function (err)
        _e = err
    end);
if _s == false then
e = _e;
_r = (function ()
--[[28589]] this["_internalEventQueue"]:push(_obj({
  [("name")]=("error.execution"),
  ["data"]=e
}));
  if true then return _noreturn; end
end)();
end;

if _r ~= _noreturn then
  return _r
end;
end),
  ["_getStatesExited"]=(function (this, transitions)
local statesExited, basicStatesExited, sortedStatesExited = statesExited, basicStatesExited, sortedStatesExited;
--[[28771]] statesExited = _new(this.opts.Set); 
--[[28823]] basicStatesExited = _new(this.opts.Set); 
--[[29143]] transitions:iter():forEach((function (this, transition)
local scope, desc = scope, desc;
--[[29208]] scope = transition.scope;  desc = scope.descendants; 
--[[29508]] this["_configuration"]:iter():forEach((function (this, state)
--[[29580]] if ((desc:indexOf(state))>((-((1))))) then
--[[29634]] basicStatesExited:add(state);
--[[29688]] statesExited:add(state);
--[[29737]] query:getAncestors(state, scope):forEach((function (this, anc)
--[[29820]] statesExited:add(anc);
end));
end;
end), this);
end), this);
--[[29952]] sortedStatesExited = statesExited:iter():sort((function (this, s1, s2)
--[[30037]] if true then return ((s2.depth)-(s1.depth)); end
end)); 
--[[30093]] if true then return _arr({[0]=basicStatesExited, sortedStatesExited}, 2); end
end),
  ["_getStatesEntered"]=(function (this, transitions)
local o, s, sortedStatesEntered = o, s, sortedStatesEntered;
--[[30242]] o = _obj({
  ["statesToEnter"]=_new(this.opts.Set),
  ["basicStatesToEnter"]=_new(this.opts.Set),
  ["statesProcessed"]=_new(this.opts.Set),
  ["statesToProcess"]=_arr({}, 0)
}); 
--[[30519]] transitions:iter():forEach((function (this, transition)
--[[30584]] transition.targets:forEach((function (this, target)
--[[30649]] (function () local _b = this; local _f = _b["_addStateAndAncestors"]; return _f(_b, target, transition.scope, o); end)();
end), this);
end), this);
--[[30854]] s = nil; 
--[[30900]] while (function () local _r =  o.statesToProcess:pop(); s  = _r; return _r; end)() do 

--[[30980]] (function () local _b = this; local _f = _b["_addStateAndDescendants"]; return _f(_b, s, o); end)();

end;
--[[31076]] sortedStatesEntered = o.statesToEnter:iter():sort((function (this, s1, s2)
--[[31165]] if true then return ((s1.depth)-(s2.depth)); end
end)); 
--[[31222]] if true then return _arr({[0]=o.basicStatesToEnter, sortedStatesEntered}, 2); end
end),
  ["_addStateAndAncestors"]=(function (this, target, scope, o)
--[[31415]] (function () local _b = this; local _f = _b["_addStateAndDescendants"]; return _f(_b, target, o); end)();
--[[31563]] query:getAncestors(target, scope):forEach((function (this, s)
--[[31634]] if ((s.typeEnum)==(STATE__TYPES.COMPOSITE)) then
--[[31852]] o.statesToEnter:add(s);
--[[31897]] o.statesProcessed:add(s);
else
--[[32041]] (function () local _b = this; local _f = _b["_addStateAndDescendants"]; return _f(_b, s, o); end)();
end;
end), this);
end),
  ["_addStateAndDescendants"]=(function (this, s, o)
--[[32214]] if o.statesProcessed:contains(s) then
if true then return ; end
end;
--[[32269]] if ((s.typeEnum)==(STATE__TYPES.HISTORY)) then
--[[32327]] if _in((s.id),(this["_historyValue"])) then
--[[32381]] this["_historyValue"][s.id]:forEach((function (this, stateFromHistory)
--[[32466]] (function () local _b = this; local _f = _b["_addStateAndAncestors"]; return _f(_b, stateFromHistory, s.parent, o); end)();
end), this);
else
--[[32597]] o.statesToEnter:add(s);
--[[32641]] o.basicStatesToEnter:add(s);
end;
else
--[[32725]] o.statesToEnter:add(s);
--[[32766]] if ((s.typeEnum)==(STATE__TYPES.PARALLEL)) then
--[[32829]] o.statesToProcess.push:apply(o.statesToProcess, s.states:filter((function (this, s)
--[[32929]] if true then return ((s.typeEnum)~=(STATE__TYPES.HISTORY)); end
end)));
else
if ((s.typeEnum)==(STATE__TYPES.COMPOSITE)) then
--[[33063]] o.statesToProcess:push(s.initialRef);
else
if ((((((s.typeEnum)==(STATE__TYPES.INITIAL)))or(((s.typeEnum)==(STATE__TYPES.BASIC)))))or(((s.typeEnum)==(STATE__TYPES.FINAL)))) then
--[[33259]] o.basicStatesToEnter:add(s);
end;
end;
end;
end;
--[[33333]] o.statesProcessed:add(s);
end),
  ["_selectTransitions"]=(function (this, currentEvent)
local states, statesAndParents, usePrefixMatchingAlgorithm, transitionSelector,
enabledTransitions, e, priorityEnabledTransitions = states, statesAndParents,
usePrefixMatchingAlgorithm, transitionSelector, enabledTransitions, e,
priorityEnabledTransitions;
--[[33462]] if this.opts.onlySelectFromBasicStates then
--[[33521]] states = this["_configuration"]:iter(); 
else
--[[33599]] statesAndParents = _new(this.opts.Set); 
--[[33809]] this["_configuration"]:iter():forEach((function (this, basicState)
--[[33886]] statesAndParents:add(basicState);
--[[33940]] query:getAncestors(basicState):forEach((function (this, ancestor)
--[[34023]] statesAndParents:add(ancestor);
end));
end), this);
--[[34121]] states = statesAndParents:iter();
end;
--[[34196]] usePrefixMatchingAlgorithm = ((((currentEvent)and(currentEvent.name)))and(currentEvent.name:search((".")))); 
--[[34310]] transitionSelector = ((usePrefixMatchingAlgorithm) and {scxmlPrefixTransitionSelector} or {this.opts.transitionSelector})[1]; 
--[[34438]] enabledTransitions = _new(this.opts.Set); 
--[[34497]] e = this["_evaluateAction"]:bind(this, currentEvent); 
--[[34564]] states:forEach((function (this, state)
--[[34612]] transitionSelector(_global, state, currentEvent, e):forEach((function (this, t)
--[[34694]] enabledTransitions:add(t);
end));
end));
--[[34770]] priorityEnabledTransitions = (function () local _b = this; local _f = _b["_selectPriorityEnabledTransitions"]; return _f(_b, enabledTransitions); end)(); 
--[[34876]] if printTrace then
this.opts.console:log(("priorityEnabledTransitions"), priorityEnabledTransitions);
end;
--[[34998]] if true then return priorityEnabledTransitions; end
end),
  ["_selectPriorityEnabledTransitions"]=(function (this, enabledTransitions)
local priorityEnabledTransitions, tuple, consistentTransitions, inconsistentTransitionsPairs = priorityEnabledTransitions, tuple, consistentTransitions, inconsistentTransitionsPairs;
--[[35156]] priorityEnabledTransitions = _new(this.opts.Set); 
--[[35223]] tuple = (function () local _b = this; local _f = _b["_getInconsistentTransitions"]; return _f(_b, enabledTransitions); end)();  consistentTransitions = tuple[(0)];  inconsistentTransitionsPairs = tuple[(1)]; 
--[[35411]] priorityEnabledTransitions:union(consistentTransitions);
--[[35481]] if printTrace then
this.opts.console:log(("enabledTransitions"), enabledTransitions);
end;
--[[35574]] if printTrace then
this.opts.console:log(("consistentTransitions"), consistentTransitions);
end;
--[[35673]] if printTrace then
this.opts.console:log(("inconsistentTransitionsPairs"), inconsistentTransitionsPairs);
end;
--[[35786]] if printTrace then
this.opts.console:log(("priorityEnabledTransitions"), priorityEnabledTransitions);
end;
--[[35908]] while (not (inconsistentTransitionsPairs:isEmpty())) do 

--[[35974]] enabledTransitions = _new(this.opts.Set, inconsistentTransitionsPairs:iter():map((function (this, t)
--[[36090]] if true then return this.opts:priorityComparisonFn(t); end
end), this));
--[[36158]] tuple = (function () local _b = this; local _f = _b["_getInconsistentTransitions"]; return _f(_b, enabledTransitions); end)();
--[[36236]] consistentTransitions = tuple[(0)];
--[[36287]] inconsistentTransitionsPairs = tuple[(1)];
--[[36345]] priorityEnabledTransitions:union(consistentTransitions);
--[[36419]] if printTrace then
this.opts.console:log(("enabledTransitions"), enabledTransitions);
end;
--[[36516]] if printTrace then
this.opts.console:log(("consistentTransitions"), consistentTransitions);
end;
--[[36619]] if printTrace then
this.opts.console:log(("inconsistentTransitionsPairs"), inconsistentTransitionsPairs);
end;
--[[36736]] if printTrace then
this.opts.console:log(("priorityEnabledTransitions"), priorityEnabledTransitions);
end;

end;
--[[36876]] if true then return priorityEnabledTransitions; end
end),
  ["_getInconsistentTransitions"]=(function (this, transitions)
local allInconsistentTransitions, inconsistentTransitionsPairs, transitionList, i, j, t1, t2, consistentTransitions = allInconsistentTransitions, inconsistentTransitionsPairs, transitionList, i, j, t1, t2, consistentTransitions;
--[[37021]] allInconsistentTransitions = _new(this.opts.Set); 
--[[37087]] inconsistentTransitionsPairs = _new(this.opts.Set); 
--[[37155]] transitionList = transitions:iter(); 
--[[37209]] if printTrace then
this.opts.console:log(("transitions"), transitionList);
end;
--[[37292]] i = (0); 
while ((i)<(transitionList.length)) do 

--[[37356]] j = ((i)+((1))); 
while ((j)<(transitionList.length)) do 

--[[37426]] t1 = transitionList[i]; 
--[[37474]] t2 = transitionList[j]; 
--[[37522]] if (function () local _b = this; local _f = _b["_conflicts"]; return _f(_b, t1, t2); end)() then
--[[37577]] allInconsistentTransitions:add(t1);
--[[37637]] allInconsistentTransitions:add(t2);
--[[37697]] inconsistentTransitionsPairs:add(_arr({[0]=t1, t2}, 2));
end;

local _r = j; j = _r + 1;
end;

local _r = i; i = _r + 1;
end;
--[[37808]] consistentTransitions = transitions:difference(allInconsistentTransitions); 
--[[37900]] if true then return _arr({[0]=consistentTransitions, inconsistentTransitionsPairs}, 2); end
end),
  ["_conflicts"]=(function (this, t1, t2)
--[[38050]] if true then return (not ((function () local _b = this; local _f = _b["_isArenaOrthogonal"]; return _f(_b, t1, t2); end)())); end
end),
  ["_isArenaOrthogonal"]=(function (this, t1, t2)
local isOrthogonal = isOrthogonal;
--[[38188]] if printTrace then
this.opts.console:log(("transition scopes"), t1.scope, t2.scope);
end;
--[[38281]] isOrthogonal = query:isOrthogonalTo(t1.scope, t2.scope); 
--[[38355]] if printTrace then
this.opts.console:log(("transition scopes are orthogonal?"), isOrthogonal);
end;
--[[38458]] if true then return isOrthogonal; end
end),
  ["registerListener"]=(function (this, listener)
--[[39222]] if true then return this["_listeners"]:push(listener); end
end),
  ["unregisterListener"]=(function (this, listener)
--[[39357]] if true then return this["_listeners"]:splice(this["_listeners"]:indexOf(listener), (1)); end
end),
  ["getAllTransitionEvents"]=(function (this)
local events, getEvents = events, getEvents;
getEvents = (function () local getEvents = nil; getEvents = function (this, state)
--[[39590]] if state.transitions then
--[[39633]] state.transitions:forEach((function (this, transition)
--[[39705]] events[transition.event] = (true);
end));
end;
--[[39797]] if state.states then
state.states:forEach(getEvents);
end;
end; getEvents:__defineGetter__("name", function () return "getEvents"; end); return getEvents; end)();
--[[39517]] events = _obj({
  
}); 
--[[39546]] 
--[[39873]] getEvents(_global, this["_model"]);
--[[39910]] if true then return Object:keys(events); end
end),
  ["getSnapshot"]=(function (this)
--[[40965]] if this["_isStepping"] then
_error(_new(Error, ("getSnapshot cannot be called while interpreter is executing a big-step")) or {})
end;
--[[41089]] 
if true then return _arr({[0]=this:getConfiguration(), (function () local _b =
this; local _f = _b["_serializeHistory"]; return _f(_b); end)(),
this["_isInFinalState"], (function () local _b = this["_model"]; local _f =
_b["$serializeDatamodel"]; return _f(_b); end)()}, 4); end
end),
  ["_serializeHistory"]=(function (this)
local o = o;
--[[41328]] o = _obj({
  
}); 
--[[41350]] Object:keys(this["_historyValue"]):forEach((function (this, sid)
--[[41417]] o[sid] = this["_historyValue"][sid]:map((function (this, state)
--[[41470]] if true then return state.id; end
end));
end), this);
--[[41518]] if true then return o; end
end)
});
--[[41618]] 
--[[42220]] 
--[[42496]] Statechart.prototype = beget(_global, BaseInterpreter.prototype);
--[[42581]] Statechart.prototype.gen = (function (this, evtObjOrName, optionalData)
local currentEvent = currentEvent;
--[[42655]] currentEvent = nil; 
--[[42681]] repeat
local _0 = ("string"); local _1 = ("object"); local _2;
local _r = (_typeof(evtObjOrName));
if _r == _0 then
currentEvent = _obj({
  ["name"]=evtObjOrName,
  ["data"]=optionalData
});
if true then break; end;
end
if _r == _1 then
if (((_typeof(evtObjOrName.name)))==(("string"))) then
--[[42941]] currentEvent = evtObjOrName;
else
--[[43013]] _error(_new(Error, ("Event object must have \"name\" property of type string.")) or {})
end;
if true then break; end;
end
_error(_new(Error, ("First argument to gen must be a string or object.")) or {})
until true
--[[43255]] if this["_isStepping"] then
_error(_new(Error, ("Cannot call gen during a big-step")) or {})
end;
--[[43373]] this["_isStepping"] = (true);
--[[43407]] (function () local _b = this; local _f = _b["_performBigStep"]; return _f(_b, currentEvent); end)();
--[[43452]] this["_isStepping"] = (false);
--[[43486]] if true then return this:getConfiguration(); end
end);
--[[43530]] 
--[[43800]] validateUriRegex = _regex2; 
--[[44104]] InterpreterScriptingContext.prototype = _obj({
  ["raise"]=(function (this, event)
--[[44191]] this["_interpreter"]["_internalEventQueue"]:push(event);
end),
  ["send"]=(function (this, event, options)
local targetIsValidUri, timeoutId = targetIsValidUri, timeoutId;
--[[44307]] options = ((options)or(_obj({
  
})));
--[[44342]] event.type = ((event.type)or(ioProcessorTypes.scxml.location));
--[[44415]] if event.target then
--[[44447]] targetIsValidUri = validateUriRegex:test(event.target); 
--[[44520]] if (not (targetIsValidUri)) then
--[[44559]] if true then return this:raise(_obj({
  ["name"]=("error.execution"),
  ["data"]=("Target is not valid URI"),
  ["sendid"]=options.sendid
})); end
end;
end;
--[[44708]] if ((eventProcessorTypes:indexOf(event.type))==((-((1))))) then
--[[44777]] this:raise(_obj({
  ["name"]=("error.execution"),
  ["data"]=("Unsupported event processor type"),
  ["sendid"]=options.sendid
}));
end;
--[[44912]] if ((options.delay)==(undefined)) then
--[[44961]] setTimeout(_global, this["_interpreter"].gen:bind(this["_interpreter"], event), (0));
else
--[[45063]] if (((_typeof(setTimeout)))==(("undefined"))) then
_error(_new(Error, ("Default implementation of Statechart.prototype.send will not work unless setTimeout is defined globally.")) or {})
end;
--[[45245]] if printTrace then
this["_interpreter"].opts.console:log(("sending event"), event.name, ("with content"), event.data, ("after delay"), options.delay);
end;
--[[45401]] timeoutId = setTimeout(_global, this["_interpreter"].gen:bind(this["_interpreter"], event), ((options.delay)or((0)))); 
--[[45519]] if options.sendid then
this["_timeoutMap"][options.sendid] = timeoutId;
end;
end;
end),
  ["cancel"]=(function (this, sendid)
--[[45658]] if (((_typeof(clearTimeout)))==(("undefined"))) then
_error(_new(Error, ("Default implementation of Statechart.prototype.cancel will not work unless setTimeout is defined globally.")) or {})
end;
--[[45840]] if _in((sendid),(this["_timeoutMap"])) then
--[[45890]] if printTrace then
this["_interpreter"].opts.console:log(("cancelling "), sendid, (" with timeout id "), this["_timeoutMap"][sendid]);
end;
--[[46028]] clearTimeout(_global, this["_timeoutMap"][sendid]);
end;
end)
});
--[[46105]] if true then return _obj({
  ["BaseInterpreter"]=BaseInterpreter,
  ["Statechart"]=Statechart,
  ["ArraySet"]=ArraySet,
  ["STATE_TYPES"]=STATE__TYPES,
  ["initializeModel"]=initializeModel,
  ["InterpreterScriptingContext"]=InterpreterScriptingContext
}); end
end));

return _module.exports;
end 
