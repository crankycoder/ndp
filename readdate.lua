#!/usr/bin/env lua

local ndp = require "ndp";

local base;
for line in io.lines() do
	if line:match("^base:") then
		-- Set the unixtime to calculate relative to, eg. base:0
		base = tonumber(line:match("^base:(%d+)$"));
	else
		local ret, start, finish = ndp.when(line, base);
		local remaining = "";
		if start and finish then
			remaining = (line:sub(1, start)..line:sub(finish, -1)):gsub("^[%s%p]+", ""):gsub("[%s%p]+$", "");
		end
		print(os.date("%c", ret).." ("..ret..")"..((#remaining>0 and (": "..remaining)) or "").." ["..(start or "?")..","..(finish or "?").."]");
	end
end

