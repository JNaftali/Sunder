
snd.method_priority = {
{balance = "special", func = function(current) snd.do_special(current) end},
{balance = "balanceneed", func = function(current) snd.do_balance_need(current) end},
{balance = "equilibriumneed", func = function(current) snd.do_equilibrium_need(current) end},
{balance = "balanceequilibrium", func = function(current) snd.do_balance_equilibrium_need(current) end},

{balance = "reject", func = function(current) snd.do_reject(current) end},
{balance = "concentrate", func = function(current) snd.do_concentrate(current) end},
{balance = "drink", func = function(current) snd.do_drink(current) end},
{balance = "vial", func = function(current) snd.do_vial(current) end},
{balance = "eat", func = function(current) snd.do_eat(current) end},
{balance = "smoke", func = function(current) snd.do_smoke(current) end},
{balance = "herb", func = function(current) snd.do_herb(current) end},
{balance = "salve", func = function(current) snd.do_salve(current) end},
{balance = "elixir", func = function(current) snd.do_elixir(current) end},
{balance = "moss", func = function(current) snd.do_moss(current) end},
{balance = "clot", func = function(current) snd.do_clot(current) end},
{balance = "stand", func = function(current) snd.do_stand(current) end},
{balance = "writhe", func = function(current) snd.do_writhe(current) end},
{balance = "focus", func = function(current) snd.do_focus(current) end},
{balance = "tree", func = function(current) snd.do_tree(current) end},

{balance = "tattoo", func = function(current) snd.do_tattoo(current) end},
{balance = "balancetake", func = function(current) snd.do_balance_take(current) end},
{balance = "equilibriumtake", func = function(current) snd.do_equilibrium_take(current) end},
{balance = "needybalancetake", func = function(current) snd.do_needy_balance_take(current) end},
{balance = "needyequilibriumtake", func = function(current) snd.do_needy_equilibrium_take(current) end},
{balance = "balanceequilibriumtake", func = function(current) snd.do_balance_equilibrium_take(current) end}
}