#include <eosio/eosio.hpp>

using namespace eosio;

int g_b = 2;

class [[eosio::contract]] hello : public contract {
    public:
        using contract::contract;

        [[eosio::action]]
            void hi(name user) {
                g_b++;
                m_a++;          
                require_auth(user);
                print("[hi] hello, ", name{user}, ", m_a = ", m_a, ", g_b = ", g_b);
            }

        [[eosio::action]]
            void say(name user) {
                m_a += 100;          
                require_auth(user);
                print("[say] hello, ", name{user}, ", m_a = ", m_a, ", g_b = ", g_b);
            }
    private:
        int m_a = 0;
};







