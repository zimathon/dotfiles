(function() {
  var _definitions, _globPatterns, _variablePatterns;

  _definitions = {};

  _variablePatterns = {
    'variable:sass': '\\$__VARIABLE__\\:[\\s?](.+)[\\;|\\n]',
    'variable:less': '\\@__VARIABLE__\\:[\\s?](.+)[\\;|\\n]'
  };

  _globPatterns = {
    'variable:sass': ['**/*.scss', '**/*.sass'],
    'variable:less': ['**/*.less']
  };

  module.exports = {
    findDefinition: function(name, type) {
      var _definition, _options, _pointer, _regex, _regexString, _results;
      if (!(_regexString = _variablePatterns[type])) {
        return;
      }
      _regex = RegExp(_regexString.replace('__VARIABLE__', name));
      _results = [];
      if (_definition = _definitions[name]) {
        _pointer = _definition.pointer;
        return (atom.project.bufferForPath(_pointer.filePath)).then((function(_this) {
          return function(buffer) {
            var _text;
            _text = buffer.getTextInRange(_pointer.range);
            _definition.definition = (_text.match(_regex))[1];
            return _definition;
          };
        })(this));
      }
      _options = !_globPatterns[type] ? null : {
        paths: _globPatterns[type]
      };
      return atom.project.scan(_regex, _options, function(result) {
        return _results.push(result);
      }).then((function(_this) {
        return function() {
          var i, pathFragment, result, _bestMatch, _bestMatchHits, _i, _j, _len, _len1, _match, _pathFragments, _targetFragments, _targetPath, _thisMatchHits;
          _targetPath = atom.workspaceView.getActivePaneItem().getPath();
          _targetFragments = _targetPath.split('/');
          _bestMatch = null;
          _bestMatchHits = 0;
          for (_i = 0, _len = _results.length; _i < _len; _i++) {
            result = _results[_i];
            _thisMatchHits = 0;
            _pathFragments = result.filePath.split('/');
            for (i = _j = 0, _len1 = _pathFragments.length; _j < _len1; i = ++_j) {
              pathFragment = _pathFragments[i];
              if (pathFragment === _targetFragments[i]) {
                _thisMatchHits++;
              }
            }
            if (_thisMatchHits > _bestMatchHits) {
              _bestMatch = result;
              _bestMatchHits = _thisMatchHits;
            }
          }
          if (!(_bestMatch && (_match = _bestMatch.matches[0]))) {
            return _this;
          }
          _definitions[name] = {
            name: name,
            type: type,
            pointer: {
              filePath: _bestMatch.filePath,
              range: _match.range
            }
          };
          return _this.findDefinition(name, type);
        };
      })(this));
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAiZmlsZSI6ICIiLAogICJzb3VyY2VSb290IjogIiIsCiAgInNvdXJjZXMiOiBbCiAgICAiIgogIF0sCiAgIm5hbWVzIjogW10sCiAgIm1hcHBpbmdzIjogIkFBSVE7QUFBQSxNQUFBLDhDQUFBOztBQUFBLEVBQUEsWUFBQSxHQUFlLEVBQWYsQ0FBQTs7QUFBQSxFQUtBLGlCQUFBLEdBQW9CO0FBQUEsSUFDaEIsZUFBQSxFQUFpQix1Q0FERDtBQUFBLElBRWhCLGVBQUEsRUFBaUIsdUNBRkQ7R0FMcEIsQ0FBQTs7QUFBQSxFQWFBLGFBQUEsR0FBZ0I7QUFBQSxJQUNaLGVBQUEsRUFBaUIsQ0FBQyxXQUFELEVBQWMsV0FBZCxDQURMO0FBQUEsSUFFWixlQUFBLEVBQWlCLENBQUMsV0FBRCxDQUZMO0dBYmhCLENBQUE7O0FBQUEsRUFxQkEsTUFBTSxDQUFDLE9BQVAsR0FJSTtBQUFBLElBQUEsY0FBQSxFQUFnQixTQUFDLElBQUQsRUFBTyxJQUFQLEdBQUE7QUFDWixVQUFBLCtEQUFBO0FBQUEsTUFBQSxJQUFBLENBQUEsQ0FBYyxZQUFBLEdBQWUsaUJBQWtCLENBQUEsSUFBQSxDQUFqQyxDQUFkO0FBQUEsY0FBQSxDQUFBO09BQUE7QUFBQSxNQUNBLE1BQUEsR0FBUyxNQUFBLENBQVEsWUFBWSxDQUFDLE9BQWIsQ0FBcUIsY0FBckIsRUFBcUMsSUFBckMsQ0FBUixDQURULENBQUE7QUFBQSxNQUdBLFFBQUEsR0FBVyxFQUhYLENBQUE7QUFNQSxNQUFBLElBQUcsV0FBQSxHQUFjLFlBQWEsQ0FBQSxJQUFBLENBQTlCO0FBQ0ksUUFBQSxRQUFBLEdBQVcsV0FBVyxDQUFDLE9BQXZCLENBQUE7QUFFQSxlQUFPLENBQUMsSUFBSSxDQUFDLE9BQU8sQ0FBQyxhQUFiLENBQTJCLFFBQVEsQ0FBQyxRQUFwQyxDQUFELENBQThDLENBQUMsSUFBL0MsQ0FBb0QsQ0FBQSxTQUFBLEtBQUEsR0FBQTtpQkFBQSxTQUFDLE1BQUQsR0FBQTtBQUN2RCxnQkFBQSxLQUFBO0FBQUEsWUFB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
//# sourceURL=/Users/sasajimay/dotfiles/.atom/packages/color-picker/lib/variable-inspector.coffee