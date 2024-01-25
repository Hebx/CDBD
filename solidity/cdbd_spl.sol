import "../libraries/spl_token.sol";
import "../libraries/mpl_metadata.sol";

@program_id("3iCbv94ivHb4of8NEeikMbk2kckLVSDmUEprpQZ1cBUw")
contract cdbd_sol {
    @payer(payer)
    constructor() {}

    function createTokenMint(
        address payer, 
        address mint, 
        address mintAuthority, 
        address freezeAuthority, 
        address metadata, 
        uint8 decimals, 
        string name, 
        string symbol, 
        string uri 
    ) public {
        // Create a new account for the mint account and Initialize the mint account
        // Set mint authority, freeze authority, and decimals for the mint account
        SplToken.create_mint(
            payer,           
            mint,           
            mintAuthority,   
            freezeAuthority, 
            decimals        
        );

        // Invoke Metadata Program to create a new account for the metadata account
        MplMetadata.create_metadata_account(
            metadata, 
            mint,  
            mintAuthority, 
            payer, 
            payer, // update authority of the metadata account
            name, 
            symbol, 
            uri 
        );
    }

    // Mint tokens to the token account
    function mintTo(address mintAuthority, address tokenAccount, address mint, uint64 amount) public {
        SplToken.mint_to(
            mint, 
            tokenAccount, 
            mintAuthority, 
            amount 
        );
    }
}