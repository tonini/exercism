var StatementAnalyzer = function(text) {
  return {

    isSilent: function() {
      return !text.length;
    },

    isAsking: function() {
      return text.slice(-1) === "?";
    },

    isYelling: function() {
      return text.toUpperCase() === text;
    },

  };
}

var Bob = function () {
  return {
    hey: function(text) {
      var analyzer = new StatementAnalyzer(text);

      if(analyzer.isSilent()) {
        return 'Fine. Be that way!';
      } else if(analyzer.isYelling()) {
        return 'Woah, chill out!';
      } else if(analyzer.isAsking()) {
        return 'Sure.';
      } else {
        return 'Whatever.';
      }
    }
  };
}

module.exports = Bob;
