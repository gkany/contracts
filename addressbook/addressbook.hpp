#include <eosio/eosio.hpp>

using namespace eosio;

class [[eosio::contract("addressbook")]] addressbook : public eosio::contract {

public:
  using contract::contract;
  
  addressbook(name receiver, name code,  datastream<const char*> ds): contract(receiver, code, ds) {}

  [[eosio::action]]
  void upsert(name user, std::string first_name, std::string last_name, std::string street, std::string city, std::string state);

  [[eosio::action]]
  void erase(name user);

private:
  struct [[eosio::table]] person {
    name key;
    std::string first_name;
    std::string last_name;
    std::string street;
    std::string city;
    std::string state;
    uint64_t primary_key() const { return key.value; }
  };
  typedef eosio::multi_index<"people"_n, person> address_index;

};    

//EOSIO_DISPATCH(addressbook, (upsert)(erase))

