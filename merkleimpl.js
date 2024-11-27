const SHA256 = require("crypto-js/sha256");

class Block {
    constructor(id, timestamp, data, prevHash = "") {
        this.id = id;
        this.timestamp = timestamp;
        this.data = data;
        this.prevHash = prevHash;
    }

    hash = this.calculateHash();

    calculateHash(){
        return SHA256(this.id + this.prevHash + this.timestamp + this.data).toString();
    }
}

class BlockChain{
    constructor(){
        this.chain = [this.createGenesisBlock()];
    }
    createGenesisBlock(){
        return new Block(0, "20/09/2021", "Hello World");
    }
    add(newBlock){
        newBlock.prevHash = this.getLastestBlock().hash;
        newBlock.hash = newBlock.calculateHash();
        this.chain.push(newBlock)
    }
    getLastestBlock(){
        return this.chain[this.chain.length - 1];
    }
    listBlockChain(){
        console.log(this.chain);
    }
    isChainValid(){
        let flag = true;
        for (let i = 1; i < this.chain.length; i++) {
            if(this.chain[i].prevHash != this.chain[i-1].hash){
                console.log("The block " + (i-1) + " is NOT VALID !!");
                console.log(this.chain[i-1]);
                flag=false;
                break;
            }
        }
        if(flag){
            console.log("The chain is VALID !!");
        }
    }
}

let bc = new BlockChain();
let b1 = new Block(0, "20/09/2021", {sender: "shaurya", receiver:"sandeep", amount:"100"});
let b2 = new Block(1, "20/09/2021", {sender: "sandeep", receiver:"vaishnav", amount:"12"});

bc.add(b1);
bc.add(b2);
bc.listBlockChain();

bc.isChainValid();

// changing the value
bc.chain[1].hash = "123";

bc.isChainValid();
