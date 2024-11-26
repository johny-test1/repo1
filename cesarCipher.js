function cesarCypherEncrypt(message,shift)
{
    let result = '';
    for(let i = 0; i<message.length ;i++)
    {
        let char = message[i];
        const code = message.charCodeAt(i);
        char = String.fromCharCode(code + shift);
        result+=char;
    }
    return result;
    
}
function cesarCypherDecrypt(ciphertext , shift)
{
    return cesarCypherEncrypt(ciphertext , -shift)
}

const message = "Divyanshu";
console.log("original message :"+message);
const encryptedText = cesarCypherEncrypt(message , 3);
console.log("Encrypted text : "+encryptedText);
const decryptedText = cesarCypherDecrypt(encryptedText,3);
console.log("Decrypted Text : "+decryptedText);