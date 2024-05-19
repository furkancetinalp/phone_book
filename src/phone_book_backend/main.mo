import Trie "mo:base/Trie";
import Text "mo:base/Text";
import Nat32 "mo:base/Nat32";
import Bool "mo:base/Bool";
import Option "mo:base/Option";

actor {

    type ContactId = Nat32;
    type Contact = {
        name: Text;
        phone: Text;
        email: Text;
        isFavorite: Bool;
        isBlocked: Bool;
    };

    type ResponseContact = {
        name: Text;
        phone: Text;
        email: Text;
        isFavorite: Bool;
        isBlocked: Bool;
        id: Nat32;
    };

   private stable var next : ContactId = 0;

   private stable var contacts : Trie.Trie<ContactId, Contact> = Trie.empty();

   public func addContact(contact : Contact) : async Text {
    if (not validatePhoneNumber(contact.phone)) {
            return ("Phone number must be a 10-digit");
        };
    let contactId = next;
    next += 1;
    contacts := Trie.replace(
      contacts,
      key(contactId),
      Nat32.equal,
      ?contact,
    ).0;
    return ("Contact Created Successfully");
  };

   public func delete(contactId : ContactId) : async Bool {
    let result = Trie.find(contacts, key(contactId), Nat32.equal);
    let exists = Option.isSome(result);
    if (exists) {
      contacts := Trie.replace(
        contacts,
        key(contactId),
        Nat32.equal,
        null,
      ).0;
    };
    return exists;
  };

  public func updateContact(contactId : ContactId, contact : Contact) : async Bool {
    let result = Trie.find(contacts, key(contactId), Nat32.equal);
    let exists = Option.isSome(result);
    if (exists) {
      contacts := Trie.replace(
        contacts,
        key(contactId),
        Nat32.equal,
        ?contact,
      ).0;
    };
    return exists;
  };


  public func deleteByName(searchKey: Text) : async Text {
    let filteredContact: Trie.Trie<ContactId, Contact> = Trie.filter<ContactId, Contact>(contacts, func (key: ContactId, contact: Contact)  { contact.name == searchKey});
     var size = Trie.size(filteredContact);
     if (size == 0) {
      return ("The name you are looking for is not in the Contact Book");
     };
     var contact:[(ResponseContact)] = Trie.toArray<ContactId, Contact, ResponseContact>(
      filteredContact,
      func(k,v): (ResponseContact) {
        {id = k; name = v.name; phone = v.phone; email= v.email; isFavorite= v.isFavorite; isBlocked= v.isBlocked }
      }
     );
     var result: Text = "Deleted Successfully";
     if(await delete(contact[0].id)) {result := "The contact is not deleted.Try again later"};
    result;
  };

   public func deleteByPhone(searchKey: Text) : async Text {
    let filteredContact: Trie.Trie<ContactId, Contact> = Trie.filter<ContactId, Contact>(contacts, func (key: ContactId, contact: Contact)  { contact.name == searchKey});
     var size = Trie.size(filteredContact);
     if (size == 0) {
      return ("The number you are looking for is not in the Contact Book");
     };
     var contact:[(ResponseContact)] = Trie.toArray<ContactId, Contact, ResponseContact>(
      filteredContact,
      func(k,v): (ResponseContact) {
        {id = k; name = v.name; phone = v.phone; email= v.email; isFavorite= v.isFavorite; isBlocked= v.isBlocked }
      }
     );
     var result: Text = "Deleted Successfully";
     if(await delete(contact[0].id)) {result := "The contact is not deleted.Try again later"};
    result;
  };

  public func getContactByName(searchKey: Text) : async Text {

  let filteredContact: Trie.Trie<ContactId, Contact> = Trie.filter<ContactId, Contact>(contacts, func (key: ContactId, contact: Contact)  { contact.name == searchKey});
     var size = Trie.size(filteredContact);
     if (size == 0) {
      return ("The name you are looking for is not in the Contact Book");
     };
     var contact:[(ResponseContact)] = Trie.toArray<ContactId, Contact, ResponseContact>(
      filteredContact,
      func(k,v): (ResponseContact) {
        {id = k; name = v.name; phone = v.phone; email= v.email; isFavorite= v.isFavorite; isBlocked= v.isBlocked }
      }
     );
     var result: Text = "\n___CONTACT:___"#contact[0].name # contact[0].phone # contact[0].email ;
     if (contact[0].isFavorite) {result #= " Favorite"} ;
     if (contact[0].isBlocked) {result #= " Blocked"} ;
     result;
  };

  public func getContactByPhone(searchKey: Text) : async Text {

  let filteredContact: Trie.Trie<ContactId, Contact> = Trie.filter<ContactId, Contact>(contacts, func (key: ContactId, contact: Contact)  { contact.name == searchKey});
     var size = Trie.size(filteredContact);
     if (size == 0) {
      return ("The phone you are looking for is not in the Contact Book");
     };
     var contact:[(ResponseContact)] = Trie.toArray<ContactId, Contact, ResponseContact>(
      filteredContact,
      func(k,v): (ResponseContact) {
        {id = k; name = v.name; phone = v.phone; email= v.email; isFavorite= v.isFavorite; isBlocked= v.isBlocked }
      }
     );
     var result: Text = "\n___CONTACT:___"#contact[0].name # contact[0].phone # contact[0].email ;
     if (contact[0].isFavorite) {result #= " Favorite"} ;
     if (contact[0].isBlocked) {result #= " Blocked"} ;
     result;
  };

 


  private func key(x : ContactId) : Trie.Key<ContactId> {
    return { hash = x; key = x };
  };


  private func validatePhoneNumber(phone: Text) : Bool {
        if (phone.size() != 10) {
            return false;
        };
        return true;
    };

   
}