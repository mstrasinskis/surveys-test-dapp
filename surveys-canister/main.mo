// import Trie "mo:base/Trie";
// import Nat32 "mo:base/Nat32";

actor Surveys {
  stable var surveys: Text = "";
  public query func get() : async Text {
    return surveys;
  };

  public func set(value : Text) : async () {
    surveys := value;
  };


  /*
  stable var entries : [(Text, Text)] = [];

  let map = Map.fromIter<Text,Nat>(
  entries.vals(), 10, Text.equal, Text.hash);

  public func register(name : Text) : async () {
    map.
    switch (map.get(name)) {
      case null  {
        map.put(name, map.size());
      };
      case (?id) { };
    }
  };

  public func lookup(name : Text) : async ?Nat {
    map.get(name);
  };

  system func preupgrade() {
    entries := Iter.toArray(map.entries());
  };

  system func postupgrade() {
    entries := [];
  };
  */


 /*
  public type SurveyId = Nat32;
  public type SurveyData = Text;
  private stable var next : SurveyId = 0
  id: JSON text
  private stable var surveys : Trie.Trie<SurveyId, SurveyData> = Trie.empty();

  public func create(survey : SurveyData) : async SurveyId {
    let surveyId = next;
    next += 1;
    surveys := Trie.replace(
      surveys,
      key(surveyId),
      Nat32.equal,
      ?survey,
    ).0;
    return surveyId;
  };

  // Read a survey.
  public query func read(surveyId : SurveyId) : async ?SurveyData {
    let result = Trie.find(surveys, key(surveyId), Nat32.equal);
    return result;
  };

  // Update a survey.
  public func update(surveyId : SurveyId, survey : SurveyData) : async Bool {
    let result = Trie.find(surveys, key(surveyId), Nat32.equal);
    let exists = Option.isSome(result);
    if (exists) {
      surveys := Trie.replace(
        surveys,
        key(surveyId),
        Nat32.equal,
        ?survey,
      ).0;
    };
    return exists;
  };

  // Delete a survey.
  public func delete(surveyId : SurveyId) : async Bool {
    let result = Trie.find(surveys, key(surveyId), Nat32.equal);
    let exists = Option.isSome(result);
    if (exists) {
      surveys := Trie.replace(
        surveys,
        key(surveyId),
        Nat32.equal,
        null,
      ).0;
    };
    return exists;
  };

  // Create a trie key from a survey identifier.
  private func key(x : SurveyId) : Trie.Key<SurveyId> {
    return { hash = x; key = x };
  };
  */

};
