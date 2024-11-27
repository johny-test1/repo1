const readline = require('readline');
const sha256 = require('sha256');

// Create an interface for user input
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Function to generate SHA-256 hash using the sha256 library
function generateSHA256Hash(input) {
    return sha256(input);
}

// Prompt the user for input
rl.question('Enter input 1: ', (input1) => {
    const hash1 = generateSHA256Hash(input1);
    console.log('SHA-256 Hash of input 1:', hash1);

    rl.question('Enter input 2: ', (input2) => {
        const hash2 = generateSHA256Hash(input2);
        console.log('SHA-256 Hash of input 2:', hash2);

        // Close the readline interface
        rl.close();
    });
});
