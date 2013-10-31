local when = require "ndp".when;

if not when then
	print("No 'when' function ?!");
end

local all_ok = true;

local function check(input, output, e_start, e_finish)
	local ret, start, finish = when(input, 0);
	if ret ~= output then
		print("FAIL: "..input.." [produces "..ret.."/"..os.date("!%c", ret).."]");
		all_ok = false;
		return false;
	elseif (e_start and e_finish) and (start ~= e_start or finish ~= e_finish) then
		print("FAIL: "..input.." [uses "..start..","..finish.." instead of "..e_start..","..e_finish.."]");
		all_ok = false;
		return false;
	end
end

check("today", 0);
check("tomorrow", 86400);
check("tomorrow morning", 117000);
check("tomorrow noon", 126000);
check("tomorrow afternoon", 131400);
check("tomorrow evening", 145800);
check("tomorrow midnight", 82800); -- Correct, but expected? :)

check("the day after tomorrow", 172800, 0, 23);

check("in 1 hour", 3600);
check("in an hour", 3600);
check("in 2 hours", 7200);
check("in a couple of hours", 7200);
check("in 3 hours", 10800);
check("in a few hours", 10800);

check("in a day", 86400);
check("in 2 days", 172800);
check("in a couple of days", 172800);
check("in 3 days", 259200);
check("in a few days", 259200);

check("next week", 604800);
check("next year", 31536000);

check("monday", 345600);
check("Monday", 345600);
check("tuesday", 432000);
check("wednesday", 518400);
check("thursday", 604800);
check("friday", 86400);
check("the friday after tomorrow", 691200);
check("the friday morning after tomorrow", 721800)
check("the friday afternoon after tomorrow", 736200)

check("2010", 1262307600);
check("Tuesday in July 2030", 1909184400);

check("feed the cat in 3 days", 259200, 13, 23);

if all_ok then
	print("OK");
end
