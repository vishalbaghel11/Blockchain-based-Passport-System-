module MyModule::PassportSystem {
    // Remove this if not using signer directly
    // use aptos_framework::signer;
    
    /// Struct representing a digital passport.
    struct Passport has store, key, copy {
        name: vector<u8>,  
        nationality: vector<u8>,
        dob: vector<u8>, 
    }

    /// Function to create a new passport (one-time registration).
    public fun register_passport(
        owner: &signer, 
        name: vector<u8>, 
        nationality: vector<u8>, 
        dob: vector<u8>
    ) {
        let passport = Passport { name, nationality, dob };
        move_to(owner, passport);
    }

    /// Function to retrieve the passport details.
    public fun view_passport(owner: address): Passport acquires Passport {
        *borrow_global<Passport>(owner)  // Now this will work with copy ability
    }
}