(function() {
  var ConditionalContextMenu, VariableInspector, _regexes;

  ConditionalContextMenu = require('./conditional-contextmenu');

  VariableInspector = require('./variable-inspector');

  _regexes = require('./ColorPicker-regexes.coffee');

  module.exports = {
    view: null,
    match: null,
    activate: function() {
      var ColorPickerView;
      atom.workspaceView.command("color-picker:open", (function(_this) {
        return function() {
          return _this.open(true);
        };
      })(this));
      ConditionalContextMenu.item({
        label: 'Color picker',
        command: 'color-picker:open'
      }, (function(_this) {
        return function() {
          if (_this.match = _this.getMatchAtCursor()) {
            return true;
          }
        };
      })(this));
      ColorPickerView = require('./ColorPicker-view');
      return this.view = new ColorPickerView;
    },
    deactivate: function() {
      return this.view.destroy();
    },
    getMatchAtCursor: function() {
      var _cursorBuffer, _cursorColumn, _cursorRow, _editor, _line;
      _editor = atom.workspace.getActiveEditor();
      if (!_editor) {
        return;
      }
      _line = _editor.getCursor().getCurrentBufferLine();
      _cursorBuffer = _editor.getCursorBufferPosition();
      _cursorRow = _cursorBuffer.row;
      _cursorColumn = _cursorBuffer.column;
      return this.matchAtPosition(_cursorColumn, this.matchesOnLine(_line, _cursorRow));
    },
    matchesOnLine: function(line, cursorRow) {
      var match, regex, type, _filteredMatches, _i, _index, _j, _len, _len1, _matches, _ref;
      if (!(line && cursorRow)) {
        return;
      }
      _filteredMatches = [];
      for (_i = 0, _len = _regexes.length; _i < _len; _i++) {
        _ref = _regexes[_i], type = _ref.type, regex = _ref.regex;
        if (!(_matches = line.match(regex))) {
          continue;
        }
        for (_j = 0, _len1 = _matches.length; _j < _len1; _j++) {
          match = _matches[_j];
          if ((_index = line.indexOf(match)) === -1) {
            continue;
          }
          _filteredMatches.push({
            match: match,
            regexMatch: match.match(RegExp(regex.source, 'i')),
            type: type,
            index: _index,
            end: _index + match.length,
            row: cursorRow
          });
          line = line.replace(match, (Array(match.length + 1)).join(' '));
        }
      }
      if (!(_filteredMatches.length > 0)) {
        return;
      }
      return _filteredMatches;
    },
    matchAtPosition: function(column, matches) {
      var _match;
      if (!(column && matches)) {
        return;
      }
      _match = (function() {
        var match, _i, _len;
        for (_i = 0, _len = matches.length; _i < _len; _i++) {
          match = matches[_i];
          if (match.index <= column && match.end >= column) {
            return match;
          }
        }
      })();
      return _match;
    },
    open: function(getMatch) {
      if (getMatch == null) {
        getMatch = false;
      }
      if (getMatch) {
        this.match = this.getMatchAtCursor();
      }
      if (!this.match) {
        return;
      }
      this.view.reset();
      this.setMatchColor();
      return this.view.open();
    },
    setMatchColor: function() {
      var _callback;
      if (!this.match) {
        return;
      }
      this.view.storage.selectedColor = null;
      if (this.match.hasOwnProperty('color')) {
        this.view.storage.selectedColor = this.match;
        this.view.inputColor(this.match);
        return;
      }
      _callback = (function(_this) {
        return function() {
          return _this.setMatchColor();
        };
      })(this);
      switch (this.match.type) {
        case 'variable:sass':
          return this.setVariableDefinitionColor(this.match, _callback);
        case 'variable:less':
          return this.setVariableDefinitionColor(this.match, _callback);
        default:
          return (function(_this) {
            return function() {
              _this.match.color = _this.match.match;
              return _callback(_this.match);
            };
          })(this)();
      }
    },
    setVariableDefinitionColor: function(match, callback) {
      var regex, type, _i, _len, _matchRegex, _ref, _variableName;
      if (!(match && callback)) {
        return;
      }
      for (_i = 0, _len = _regexes.length; _i < _len; _i++) {
        _ref = _regexes[_i], type = _ref.type, regex = _ref.regex;
        if (type === match.type) {
          _matchRegex = regex;
        }
      }
      _variableName = (match.match.match(RegExp(_matchRegex.source, 'i')))[2];
      return (VariableInspector.findDefinition(_variableName, match.type)).then((function(_this) {
        return function(definition) {
          var _color, _matches;
          _matches = _this.matchesOnLine(definition.definition, 1);
          if (!(_matches && (_color = _matches[0]))) {
            return _this.view.error();
          }
          if ((_color.type.split(':'))[0] === 'variable') {
            return _this.view.error();
          }
          match.color = _color.match;
          match.type = _color.type;
          match.pointer = definition.pointer;
          return callback(match);
        };
      })(this));
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAiZmlsZSI6ICIiLAogICJzb3VyY2VSb290IjogIiIsCiAgInNvdXJjZXMiOiBbCiAgICAiIgogIF0sCiAgIm5hbWVzIjogW10sCiAgIm1hcHBpbmdzIjogIkFBSVE7QUFBQSxNQUFBLG1EQUFBOztBQUFBLEVBQUEsc0JBQUEsR0FBeUIsT0FBQSxDQUFRLDJCQUFSLENBQXpCLENBQUE7O0FBQUEsRUFDQSxpQkFBQSxHQUFvQixPQUFBLENBQVEsc0JBQVIsQ0FEcEIsQ0FBQTs7QUFBQSxFQUdBLFFBQUEsR0FBVyxPQUFBLENBQVEsOEJBQVIsQ0FIWCxDQUFBOztBQUFBLEVBUUEsTUFBTSxDQUFDLE9BQVAsR0FDSTtBQUFBLElBQUEsSUFBQSxFQUFNLElBQU47QUFBQSxJQUNBLEtBQUEsRUFBTyxJQURQO0FBQUEsSUFHQSxRQUFBLEVBQVUsU0FBQSxHQUFBO0FBQ04sVUFBQSxlQUFBO0FBQUEsTUFBQSxJQUFJLENBQUMsYUFBYSxDQUFDLE9BQW5CLENBQTJCLG1CQUEzQixFQUFnRCxDQUFBLFNBQUEsS0FBQSxHQUFBO2VBQUEsU0FBQSxHQUFBO2lCQUFHLEtBQUMsQ0FBQSxJQUFELENBQU0sSUFBTixFQUFIO1FBQUEsRUFBQTtNQUFBLENBQUEsQ0FBQSxDQUFBLElBQUEsQ0FBaEQsQ0FBQSxDQUFBO0FBQUEsTUFFQSxzQkFBc0IsQ0FBQyxJQUF2QixDQUE0QjtBQUFBLFFBQ3hCLEtBQUEsRUFBTyxjQURpQjtBQUFBLFFBRXhCLE9BQUEsRUFBUyxtQkFGZTtPQUE1QixFQUdHLENBQUEsU0FBQSxLQUFBLEdBQUE7ZUFBQSxTQUFBLEdBQUE7QUFBRyxVQUFBLElBQWUsS0FBQyxDQUFBLEtBQUQsR0FBUyxLQUFDLENBQUEsZ0JBQUQsQ0FBQSxDQUF4QjtBQUFBLG1CQUFPLElBQVAsQ0FBQTtXQUFIO1FBQUEsRUFBQTtNQUFBLENBQUEsQ0FBQSxDQUFBLElBQUEsQ0FISCxDQUZBLENBQUE7QUFBQSxNQU9BLGVBQUEsR0FBa0IsT0FBQSxDQUFRLG9CQUFSLENBUGxCLENBQUE7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
//# sourceURL=/Users/sasajimay/dotfiles/.atom/packages/color-picker/lib/ColorPicker.coffee