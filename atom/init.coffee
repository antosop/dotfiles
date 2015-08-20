# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
child_process = require 'child_process'
exec = child_process.exec;

atom.commands.add 'atom-text-editor', 'xaml:open-in-fiver-studio', ->
		return unless editor = atom.workspace.getActiveTextEditor()

		filePath = editor.getPath()

		child = exec \
		'"N:\\Products\\Tools\\Html5 Tools\\FiverStudio\\FiverStudio.exe" ' + filePath,
		{cwd: 'C:\\html5'},
		(error, stdout, stderr) ->
			 console.log stderr
				unless error is null
					 console.log 'error: ' + error
