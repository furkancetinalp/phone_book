# phone_book

Welcome to your new phone_book project and to the internet computer development community. By default, creating a new project adds this README and some template files to your project directory. You can edit these template files to customize your project and to include your own code to speed up the development cycle.

To get started, you might want to explore the project directory structure and the default configuration file. Working with this project in your development environment will not affect any production deployment or identity tokens.

To learn more before you start working with phone_book, see the following documentation available online:

- [Quick Start](https://internetcomputer.org/docs/current/developer-docs/setup/deploy-locally)
- [SDK Developer Tools](https://internetcomputer.org/docs/current/developer-docs/setup/install)
- [Motoko Programming Language Guide](https://internetcomputer.org/docs/current/motoko/main/motoko)
- [Motoko Language Quick Reference](https://internetcomputer.org/docs/current/motoko/main/language-manual)

If you want to start working on your project right away, you might want to try the following commands:

```bash
cd phone_book/
dfx help
dfx canister --help
```

## Running the project locally

If you want to test your project locally, you can use the following commands:

```bash
# Starts the replica, running in the background
dfx start --background

# Deploys your canisters to the replica and generates your candid interface
dfx deploy
```

Once the job completes, your application will be available at `http://localhost:4943?canisterId={asset_canister_id}`.

If you have made changes to your backend canister, you can generate a new candid interface with

```bash
npm run generate
```

at any time. This is recommended before starting the frontend development server, and will be run automatically any time you run `dfx deploy`.

If you are making frontend changes, you can start a development server with

```bash
npm start
```

Which will start a server at `http://localhost:8080`, proxying API requests to the replica at port 4943.

### Note on frontend environment variables

If you are hosting frontend code somewhere without using DFX, you may need to make one of the following adjustments to ensure your project does not fetch the root key in production:

- set`DFX_NETWORK` to `ic` if you are using Webpack
- use your own preferred method to replace `process.env.DFX_NETWORK` in the autogenerated declarations
  - Setting `canisters -> {asset_canister_id} -> declarations -> env_override to a string` in `dfx.json` will replace `process.env.DFX_NETWORK` with the string in the autogenerated declarations
- Write your own `createActor` constructor


CANISTER
IC üzerine binlerce farklı uygulama çalışmaktadır. Tüm bu uygulamalar canister adı verilen özel kutu-konteynerlarda depolanmaktadır. IC, bu uygulamaların sağlıklı şekilde çalışmasından sorumludur.
Kullanıcılar bu canisterlara istek/ mesaj göndererek bu canisterlar ile etkileşimde bulunurlar
IC tabanlı bir uygulamada gönderi isteği Atıştırmalıklar
Başka bir adrese token göndermek
NFT satın almak veya satmak
ICP tabanlı bir web sitesinde ilgili içerikleri okumak 

Canister genel olarak WebAssemblyMemory ve WebAssemblyModuleden oluşur
WebAssembly module => Rust veya Motoko gibi dillerden derlenmiş bir kod parçasıdır. Bu, kutuya yerleştirilen ve sonuçta çalışan koddur.
 WebAssembly memory => Hafıza birimi de denir. Burası kutunun durumunun ve dosyaların (fotoğraflar, videolar, jetonlar...) saklandığı yerdir. WebAssembly modülü tarafından çalıştırılan kod belleği değiştirecektir.


WebAssembly nedir?
Low level yani düşük seviyeli binary formattır. 
Tarayıcılar, bulut platformu, akıllı cihazlar, sanal makine gibi platformlarda ilgili kodun çalıştırılmasını sağlayan bir mekanizmadır

Avantajları
Birden çok dilde yazılan kodu destekler (C, C++, Rust, Motoko)
Hemen hemen her cihazda çalışabilir (mimari x64 , x86)
Yüsek performanslıdır
Güvenli bir çalışma sağlar

Dezavantajları
Low level adı verilen ve makine diline yakın bir dildir. Makine diline yaklaştıkça öğrenmek ve bu tür dillerde kompleks uygulamalar geliştirmek
zorlaşır. Büyük uygulamalar geliştirmek hem daha büyük zahmete sebep olur hem de projenin ölçeklenmesini güçleştirir


Motoko Programlala Dili
Yukarıdaki bu sorunları çözmek için Dfinity tarafından Motoko dili geliştirilmiştir.
Merkezi olmayan uygulamalar (dAppler) oluşturmak için özel olarak tasarlanmış dildir
Motoko direkt olarak Wasm ile compile sağlayabilir
Bir high level yani yüksek seviyeli bir dildir



ACTOR MODEL NEDİR?

Aktör, Motokoda bir canisterın nasıl temsil edildiği ve soyutlandığıdır
Aynı anda birden çok görevi, eylemi yerine getirecek bir proje yazmak için bir yol olarak karşımıza çıkar.
Yani actor building block adı verilen tasarım bloğunu temsil eder

Actor, canisterın programlama kısmını temsil eden, içinde birden fazla değişken, fonksiyon barındırabilen bir yapıdır.

actor {
    var message : Text = "Hello Motoko Bootcamp!";

    public func changeMessage(t : Text) : async () {
        message := t;
    };

    public query func readMessage() : async Text {
        return message;
    };
};

Update vs Query
Update, canisterın state'ini ' yani durmunu değiştirmeyi sağlayan bir bildirim yöntemidir
Posting on a social media,
Seding a message on a messaging application
Buying a NFT

Query ise canisterın durumunu değiştirmez, oradan veri almayı sağlar
Reading an article
















