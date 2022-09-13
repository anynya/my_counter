// Create a simple Counter actor.
import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor Counter {
  stable var currentValue : Nat = 0;

  // Increment the counter with the increment function.
  public func increment() : async () {
    currentValue += 1;
  };

  // Read the counter value with a get function.
  public query func get() : async Nat {
    currentValue
  };

  // Write an arbitrary value with a set function.
  public func set(n: Nat) : async () {
    currentValue := n;
  };

  type HttpResponse = {
    status_code: Nat16;
    headers: [HeaderField];
    body: Blob;
  };

  type HttpRequest = {
    method: Text;
    url: Text;
    headers: [HeaderField];
    body: Blob;
  };

  type HeaderField = (Text, Text);

  public query func http_request(req : HttpRequest) : async HttpResponse {
    {
        status_code = 200;
        headers = [ ("content-type", "text/plain") ];
        body = Text.encodeUtf8("count: " # Nat.toText(currentValue));
      }
  }
}
