
#[rustler::nif]
fn clean(html: String) -> String {
    ammonia::clean(&html)
}

rustler::init!("Elixir.Ammoniex.Nif", [clean]);
