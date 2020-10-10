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
	LoadActor("main-menu-bg") .. 
	{
	}
}

-- FOREGROUND
t[#t + 1] = Def.ActorFrame {
	InitCommand = function(self)
		self:xy(SCREEN_LEFT+200,SCREEN_TOP+200)
    end,
    LoadActor("main-menu-lines") .. --logo title
    {
        OnCommand = function(self)
            self:y(125):diffusealpha(1)
        end
    },
    LoadActor("arrow-small-logo") .. --logo arrow
    {
        OnCommand = function(self)
            self:y(-25):diffusealpha(1)
        end
    },
    LoadActor("title-large-logo") .. --logo title
    {
        OnCommand = function(self)
            self:xy(355,-15):zoom(0.5):diffusealpha(0):linear(1):diffusealpha(1)
        end
    }
}



return t