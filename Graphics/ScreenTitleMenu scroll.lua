local gc = Var("GameCommand")
local itemText = gc:GetText()
local textWidth = 0

return Def.ActorFrame {
	Def.Quad {
		OnCommand = function(self)
			self:halign(0):valign(0):xy(-20,-5):diffuse(color("1,1,1,1")):setsize(textWidth,40)
		end,
		GainFocusCommand = function(self)
			self:zoomtowidth(0):linear(0.1):zoomtowidth(textWidth)
		end,
		LoseFocusCommand = function(self)
			self:zoomtowidth(textWidth):linear(0.1):zoomtowidth(0)
		end
	},
	LoadFont("Common Large") ..
	{
		Text = itemText,
		InitCommand = function(self)
			self:halign(0):valign(0):zoom(.5)
			textWidth = self:GetWidth()/2+40 --magic numberssssss
		end,
		GainFocusCommand = function(self)
			self:sleep(0.05):diffuse(color("0,0,0,1"))
		end,
		LoseFocusCommand = function(self)
			self:sleep(0.05):diffuse(color("1,1,1,1"))
		end
	}
}
