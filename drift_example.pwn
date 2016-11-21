#include <a_samp>
#include <izcmd>
#include <drift>

main() {}
CMD:v(playerid, params[])
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	new v = CreateVehicle(411, x, y, z+1, 0, 211, 1, -1);
	PutPlayerInVehicle(playerid, v, 0);
	return true;
}
public OnDriftStart(playerid)
{
	GameTextForPlayer(playerid, "~g~Drift Started!", 1000, 6);
	return true;
}
public OnDriftUpdate(playerid, Float: drift_angle, Float: speed)
{
	new tmpstr[128];
	format(tmpstr, sizeof tmpstr, "~g~Drifting!!~n~~b~Angle:~r~ %0.1f~n~~b~Speed: ~r~%0.1f", drift_angle, speed);
	GameTextForPlayer(playerid, tmpstr, 1000, 6);
	return true;
}
public OnDriftEnd(playerid, reason, Float: distance, time)
{
	new tmpstr[128];
	format(tmpstr, sizeof tmpstr, "~g~Drift End!!~n~~b~Distance:~r~ %0.1f~n~~b~Seconds: ~r~%d", distance, time / 1000);
	GameTextForPlayer(playerid, tmpstr, 1000, 6);
	return true; 
}