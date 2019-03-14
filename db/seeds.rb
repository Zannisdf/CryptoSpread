# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

coins = [
  {
    name: 'Bitcoin',
    description: 'Bitcoin (BTC) is a consensus network that enables a new payment system and a completely digital currency. Powered by its users, it is a peer to peer payment network that requires no central authority to operate. On October 31st, 2008, an individual or group of individuals operating under the pseudonym "Satoshi Nakamoto" published the Bitcoin Whitepaper and described it as: "a purely peer-to-peer version of electronic cash would allow online payments to be sent directly from one party to another without going through a financial institution."',
    sym: 'BTC'
  },
  {
    name: 'Ethereum',
    description: 'Ethereum (ETH) is a smart contract platform that enables developers to build decentralized applications (dapps) conceptualized by Vitalik Buterin in 2013. ETH is the native currency for the Ethereum platform and also works as the transaction fees to miners on the Ethereum network. Ethereum is the pioneer for blockchain based smart contracts. When running on the blockchain a smart contract becomes like a self-operating computer program that automatically executes when specific conditions are met. On the blockchain, smart contracts allow for code to be run exactly as programmed without any possibility of downtime, censorship, fraud or third-party interference. It can facilitate the exchange of money, content, property, shares, or anything of value. The Ethereum network went live on July 30th, 2015 with 72 million Ethereum premined.',
    sym: 'ETH'
  },
  {
    name: 'XRP',
    description: 'Ripple (XRP) is an independent digital asset that is native to the Ripple Consensus Ledger. With proven governance and the fastest transaction confirmation of its kind, XRP is said to be the most efficient settlement option for financial institutions and liquidity providers seeking global reach, accessibility and fast settlement finality for interbank flows.',
    sym: 'XRP'
  },
  {
    name: 'EOS',
    description: 'EOS.IO is a blockchain protocol powered by the native cryptocurrency EOS. The protocol emulates most of the attributes of a real computer including hardware (CPU(s) & GPU(s) for processing, local/RAM memory, hard-disk storage) with the computing resources distributed equally among EOS cryptocurrency holders. EOSIO operates as a smart contract platform and decentralized operating system intended for the deployment of industrial-scale decentralized applications through a decentralized autonomous corporation model. The smart contract platform claims to eliminate transaction fees and also conduct millions of transactions per second. EOS (EOS) is software that introduces a blockchain architecture designed to enable vertical and horizontal scaling of decentralized applications. The EOS software provides accounts, authentication, databases, asynchronous communication and the scheduling of applications across multiple CPU cores and/or clusters.',
    sym: 'EOS'
  },
  {
    name: 'Litecoin',
    description: 'Litecoin is a peer-to-peer cryptocurrency created by Charlie Lee. It was created based on the Bitcoin protocol but differs in terms of the hashing algorithm used. Litecoin uses the memory intensive Scrypt proof of work mining algorithm. Scrypt allows consumer-grade hardware such as GPU to mine those coins.',
    sym: 'LTC'
  },
  {
    name: 'Stellar',
    description: 'The Stellar network is an open source, distributed, and community owned network used to facilitate cross-asset transfers of value. Stellar aims to help facilitate cross-asset transfer of value at a fraction of a penny while aiming to be an open financial system that gives people of all income levels access to low-cost financial services. Stellar can handle exchanges between fiat-based currencies and between cryptocurrencies. Stellar.org, the organization that supports Stellar, is centralized like XRP and meant to handle cross platform transactions and micro transactions like XRP. However, unlike Ripple, Stellar.org is non-profit and their platform itself is open source and decentralized. Through the use of its intermediary currency Lumens (XLM), a user can send any currency that they own to anyone else in a different currency. Stellar was founded by Jed McCaleb in 2014. Jed McCaleb is also the founder of Mt. Gox and co-founder of Ripple, launched the network system Stellar with former lawyer Joyce Kim. Stellar is also a payment technology that aims to connect financial institutions and drastically reduce the cost and time required for cross-border transfers. In fact, both payment networks used the same protocol initially.',
    sym: 'XLM'
  },
  {
    name: 'Tron',
    description: 'TRON (TRX) strives to build the future of a truly decentralized internet and global free content entertainment system that utilizes blockchain technology. The TRON Protocol represents the architecture of an operating system based on the blockchain which could enable developers to create smart contracts and decentralized applications, freely publish, own, and store data and other content. According to the TRON Foundation, the ecosystem surrounding this network specializes in offering massive scalability and consistent reliability capable of processing transactions at a high rate via high-throughput computing.',
    sym: 'TRX'
  },
  {
    name: 'Cardano',
    description: 'Cardano (ADA) is a decentralized platform that will allow complex programmable transfers of value in a secure and scalable fashion. It is one of the first blockchains to be built in the Haskell programming language. Cardano is developing a smart contract platform which seeks to deliver more advanced features than any protocol previously developed. It is the first blockchain platform to evolve out of a scientific philosophy and a research-first driven approach. The development team consists of a large global collective of expert engineers and researchers. The protocol features a layered blockchain software stack that is flexible, scalable, and is being developed with the most rigorous academic and commercial software standards in the industry. Cardano will use a democratic governance system that allows the project to evolve over time, and fund itself sustainably through a visionary treasury system.',
    sym: 'ADA'
  },
  {
    name: 'Monero',
    description: "Monero (XMR) is a private, secure, and untraceable cryptocurrency that was launched April 18th, 2014. With Monero, it is said you are in complete control of your funds and privacy no one else can see anyone else's balances or transactions.",
    sym: 'XMR'
  },
  {
    name: 'IOTA',
    description: "IOTA (IOTA) is a distributed ledger for the Internet of Things that uses a directed acyclic graph (DAG) instead of a conventional blockchain. Its quantum-proof protocol, Tangle, reportedly brings benefits like 'zero fees, infinite scalability, fast transactions, and secure data transfer'. The IOTA Tangle is a Directed Acyclic Graph which has no fees on transactions and no fixed limit on how many transactions can be confirmed per second in the network; instead, the throughput grows in conjunction with activity in the network; i.e., the more activity, the faster the network.",
    sym: 'IOTA'
  },
  {
    name: 'Dash',
    description: 'Dash (DASH), formerly known as Darkcoin until March 26th, 2015, is a privacy-centric digital currency with instant transactions. Similar to cash, Dash allows you to remain anonymous while transacting. Dash protects privacy by anonymizing transactions that are made over the network using a technology developed by the Dash team called DarkSend. DarkSend is inspired by the CoinJoin project that was birthed to anonymize Bitcoin transactions. Using Dash, payments are private and cannot be tracked along with balances. Dash harnesses the power of its Masternode network to power an innovative technology called InstantX. When sending funds, users can use InstantX and transactions will be fully sent and irreversible within four seconds. Dash was released on the 18th January 2014 with zero premine coins. It uses 11 rounds of hashing algorithm namely blake, bmw, groestl, jh, keccak, skein, luffa, cubehash, shavite, simd, and echo. As of the current design, there will only be 22 million Dash ever created, making it a deflationary currency.',
    sym: 'DASH'
  },
  {
    name: 'Maker',
    description: 'Maker is a smart contract platform on the Ethereum chain that backs and stabilizes the value of stablecoin DAI through a dynamic system of Collateralized Debt Positions (CDP), autonomous feedback mechanisms, and appropriately incentivized external actors. MKR tokens are created or destroyed in accordance with price fluctuations of the DAI coin in order to keep it as close to $1 USD as possible, and is part of a fully inspectable system on the Ethereum blockchain. MKR tokens are also used to pay transaction fees on the Maker system, and provides holders with voting rights within Maker’s continuous approval voting system.',
    sym: 'MKR'
  },
  {
    name: 'NEO',
    description: "NEO (NEO), formerly Antshares, aims to build a 'smart economy' by incorporating digital assets, digital identities, and smart contracts. Developed by Onchain DNA, Neo's dual-token ecosystem can be used for creating dApps and ICOs. Its Delegated Byzantine Fault Tolerance (dBFT) consensus algorithm is purportedly faster than the PoW used by Ethereum and Bitcoin.",
    sym: 'NEO'
  },
  {
    name: 'NEM',
    description: "NEM (XEM), which stands for New Economy Movement, is a dual-layer blockchain that is written in Java and launched in 2015. The NEM mainnet supports multiple ledgers and has a NEM Smart Asset system, where nodes on the NEM blockchain process API calls. Its native currency is XEM, is 'harvested' using its POI (Proof-of-Importance) algorithm. The 'importance' of NEM users is determined by the number of coins they have and the number of transactions associated with their wallet. NEM also has an encrypted P2P messaging system, multisignature accounts, and an Eigentrust++ reputation system.",
    sym: 'XEM'
  },
  {
    name: 'Zcash',
    description: 'Launched in 2016 by Zooko Wilcox-O’Hearn and based on the Zerocoin protocol, Zcash (ZEC) is a decentralized and open-source privacy-focused cryptocurrency that enables selective transparency of transactions. Zcash transactions can either be transparent or shielded through a zero-knowledge proof called zk-SNARKs. This allows the network to maintain a secure ledger of balances without disclosing the parties or amounts involved. Instead of publishing spend-authority and transaction values, the transaction metadata is encrypted and zk-SNARKs are used to prove that nobody is being dishonest.',
    sym: 'ZEC'
  },
  {
    name: 'Ontology',
    description: "Ontology is an enterprise-grade blockchain network that provides secure and bespoke client chains. It combines several protocols with a view towards building a distributed trust system. These include protocols for smart contracts, identity, data and information exchange. The Ontology network functions as a connector between several blockchains. ONT is the network's native token. Ontology was launched in 2017 by OnChain, an entity that has ties with NEO.",
    sym: 'ONT'
  },
  {
    name: 'Texos',
    description: "Developed by ex-Morgan Stanley analyst Arthur Breitman. Tezos (XTZ) is a multi-purpose platform that supports dApps and smart contracts. It aims to combine a self-correcting protocol and on-chain governance to manage network modifications. Tezos is powered by XTZ, which is created through 'baking'. Bakers put up deposits and are rewarded for signing and publishing blocks. Witnesses then validate the blocks. Dishonest bakers lose their XTZ deposits. Tezos uses delegated proof-of-stake (DPoS) and supports Turing complete smart contracts. Tezos is implemented in the OCaml programming language, which is said to offer 'functional, imperative, and object-oriented styles'.",
    sym: 'XTZ'
  },
  {
    name: 'Waves',
    description: 'Designed from scratch for storing, managing, and issuing digital assets, Waves (WAVES) is an open source decentralized blockchain platform that enables anyone to create their own internal digital currencies. Building on approaches implemented by NXT to make adding new transaction types possible, WAVES approaches this practice via plug-ins that do not require an update to the core software, but instead may be installed as extensions on top of it. As a result, clients not running software with these additional plug-ins may still relay custom transaction types without the need to support a mandatory hard fork of the core code.',
    sym: 'WAVES'
  },
  {
    name: 'Dogecoin',
    description: 'Based on the popular "Doge" Internet meme and featuring a Shiba Inu on its logo, Dogecoin (DOGE) is a cryptocurrency that was forked from Litecoin in Dec 2013. Dogecoin has been used primarily as a tipping system on Reddit and Twitter to reward the creation or sharing of quality content. Dogecoin was created by Billy Markus from Portland, Oregon and Jackson Palmer from Sydney, Australia. Both had envisaged Dogecoin as a fun, light-hearted cryptocurrency that would have greater appeal beyond the core Bitcoin audience.',
    sym: 'DOGE'
  },
  {
    name: 'Chainlink',
    description: 'Chainlink (LINK) is a decentralized oracle service, which aims to connect smart contracts with data from the real world. Since blockchains cannot access data outside their network, oracles are needed to function as data feeds in smart contracts. Oracles provide external data (e.g. temperature, weather) that trigger smart contract executions upon the fulfillment of pre-defined conditions. Participants on the Chainlink network are incentivized (through rewards) to provide smart contracts with access to external data feeds. Should users desire access to off-chain data, they can submit a requesting contract to ChainLink’s network. These contracts will match the requesting contract with the appropriate oracles. The contracts include a reputation contract, an order-matching contract, and an aggregating contract. The aggregating contract gathers data of the selected oracles to find the most accurate result.',
    sym: 'LINK'
  }
]

markets = [
  {
    name: 'ZB',
    url: 'https://www.zb.com/'
  },
  {
    name: 'Hitbit',
    url: 'https://hitbtc.com/'
  },
  {
    name: 'BitForex',
    url: 'https://bitforex.com/'
  },
  {
    name: 'Binance',
    url: 'https://www.binance.com/'
  },
  {
    name: 'Coinbene',
    url: 'https://www.coinbene.com/'
  },
  {
    name: 'Bittrex',
    url: 'https://international.bittrex.com/'
  },
  {
    name: 'Poloniex',
    url: 'https://poloniex.com/'
  },
  {
    name: 'OKEx',
    url: 'https://www.okex.com/'
  },
  {
    name: 'Gate.io',
    url: 'https://gate.io/'
  }
]

Coin.destroy_all
Market.destroy_all

coins.each do |coin_data|
  Coin.create(
    name: coin_data[:name],
    description: coin_data[:description],
    sym: coin_data[:sym]
  )
end

markets.each do |market_data|
  Market.create(
    name: market_data[:name],
    url: market_data[:url]
  )
end

# users = User.all
# coins = Coin.all

# Comment.destroy_all

# 50.times do |i|
#   Comment.create(
#     user: users.sample,
#     coin: coins.sample,
#     content: "Comentario #{i}, adfasdfasdfasdfasdfasdfasdfasdfasdfasdf"
#   )
# end