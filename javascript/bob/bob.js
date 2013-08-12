var StatementAnalyzer = function(text) {

  var text = text;

  return {

    isSaysNothing: function() {
      return (!text.length ? true : false);
    },

    isAsking: function() {
      if(text.charAt(text.length - 1) === "?") {
        return true;
      } else {
        return false;
      }
    },

    isYelling: function() {
      return (text.toUpperCase() === text ? true : false);
    },

  };
}

var Bob = function () {
  return {
    hey: function(text) {
      var analyzer = new StatementAnalyzer(text);

      if(analyzer.isSaysNothing()) {
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
