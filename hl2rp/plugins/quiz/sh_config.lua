-- Config table for the quiz plugin.
nut.config.quiz = {}
-- Questions for the quiz plugin.
nut.config.quiz.questions = {
	[1] = {
		question = "You do not need weapons to roleplay, do you understand?",
		options = {
			[1] = "Yes.",
			[2] = "No."
		},
		correct = 1
	},
	[2] = {
		question = "You do not need item to roleplay, do you understand?",
		options = {
			[1] = "Yes.",
			[2] = "No."
		},
		correct = 1
	},
	[3] = {
		question = "Can you type properly, using capital letters and full-stops?",
		options = {
			[1] = "yes i can",
			[2] = "Yes, I can.",
			[3] = "yes, i can."
		},
		correct = 2
	}
}
-- The default text to be shown for questions which a player have not yet selected an answer for.
nut.config.quiz.defaultText = "Select one"
-- How wide the quiz menu is. This is a ratio for the screen's width. (0.5 = half of the screen's width)
nut.config.quiz.menuWidth = 0.5
-- How tall the quiz menu is. This is a ratio for the screen's height. (0.5 = half the screen's height)
nut.config.quiz.menuHeight = 0.75
-- The kick message a player should recieve if they have any incorrect answers.
nut.config.quiz.kickMessage = "One or more of your answers were incorrect, you may rejoin to try again"
-- Whether or not the passedQuiz column should attempt to to added to the player table (MySQL).
-- Have this turned on the first time you use the plugin. When the comlumn has been added you can then
-- turn it off to avoid getting a MySQL error on startup and reloads
nut.config.quiz.addColumn = true

