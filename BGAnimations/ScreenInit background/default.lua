local t = Def.ActorFrame {}

-- BACKGROUND
t[#t + 1] = Def.ActorFrame {
	InitCommand = function(self)
		self:Center()
	end,
	Def.Quad {
		InitCommand = function(self)
			self:scaletoclipped(SCREEN_WIDTH, SCREEN_HEIGHT)
		end,
		OnCommand = function(self)
			self:diffuse(color("0,0,0,1")):diffusetopedge(color("0.1,0.1,0.1,1"))
		end
	},
	LoadActor("concentric-circles-diag-bg") .. 
	{
	}
}

-- FOREGROUND
t[#t + 1] = Def.ActorFrame {
	InitCommand = function(self)
		self:Center()
	end,
	Def.ActorFrame {
		LoadActor("arrow-large-logo") .. --logo arrow
		{
			OnCommand = function(self)
				self:y(-25):diffusealpha(0):linear(1):diffusealpha(1)
			end
		}
	},
	Def.ActorFrame {
		LoadActor("title-large-logo") .. --logo title
		{
			OnCommand = function(self)
				self:y(115):diffusealpha(0):sleep(0.5):linear(1):diffusealpha(1)
			end
		}
	},
	Def.ActorFrame { --text
		OnCommand = function(self)
			self:playcommandonchildren("ChildrenOn")
		end,
		ChildrenOnCommand = function(self)
			self:diffusealpha(0):sleep(2):linear(0.25):diffusealpha(1)
		end,
		LoadFont("Common Large") ..
		{
			Text = "PRESS ENTER",
			InitCommand = function(self)
				self:y(SCREEN_HEIGHT/2-150):zoom(0.8)
			end,
			OnCommand = function(self)
				self:diffuse(color("1,1,1,1"))
			end
		}
	}
}

return t
