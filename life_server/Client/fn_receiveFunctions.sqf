_client = _this select 0;

_exec = {
	_functions = _this select 0;
	{
		_name = _x select 0;
		_code = _x select 1;
		missionNamespace setVariable [_name,_code];
	}forEach _functions;
	life_serverFunctionsReady = true;
};

[[allFunctions],_exec] remoteExecCall ["call",_client];
//diag_log "* * * receiveFunctions Started * * *";