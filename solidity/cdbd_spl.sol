import {SplToken} from  "../libraries/spl_token.sol";
import {MplMetadata} from "../libraries/mpl_metadata.sol";



@program_id("DZnKrLmMnmhWV6zXz8E2e1r173WcSxatHam7BpRhjzqy")
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