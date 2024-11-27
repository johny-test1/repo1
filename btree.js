const crypto = require('crypto');

// Class to represent a node in the Merkle Tree
class TreeNode {
    constructor(data) {
        this.data = data;
        this.left = null;
        this.right = null;
        this.hash = this.computeHash();
    }

    computeHash() {
        return crypto.createHash('sha256').update(this.data).digest('hex');
    }
}

// Class to represent the Merkle Tree
class MerkleTree {
    constructor(dataList) {
        // Create leaf nodes
        this.leaves = dataList.map(data => new TreeNode(data));
        // Build the tree and get the root
        this.root = this.buildTree(this.leaves);
    }

    buildTree(nodes) {
        if (nodes.length === 1) {
            return nodes[0];
        }

        let newLevel = [];
        for (let i = 0; i < nodes.length - 1; i += 2) {
            let left = nodes[i];
            let right = nodes[i + 1];
            let combinedData = left.hash + right.hash;
            let parent = new TreeNode(combinedData);
            parent.left = left;
            parent.right = right;
            newLevel.push(parent);
        }

        // If there's an odd number of nodes, the last node is promoted as is
        if (nodes.length % 2 === 1) {
            newLevel.push(nodes[nodes.length - 1]);
        }

        return this.buildTree(newLevel);
    }

    getRootHash() {
        return this.root ? this.root.hash : null;
    }
}

// Function to create a Merkle Tree for two lists and display their roots
function createAndDisplayMerkleTrees(list1, list2) {
    const tree1 = new MerkleTree(list1);
    const tree2 = new MerkleTree(list2);

    console.log('Merkle Root Hash for List 1:', tree1.getRootHash());
    console.log('Merkle Root Hash for List 2:', tree2.getRootHash());
}

// Example data lists
const dataList1 = ['transactionA1', 'transactionA2', 'transactionA3', 'transactionA4'];
const dataList2 = ['transactionB1', 'transactionB2', 'transactionB3', 'transactionB4'];

createAndDisplayMerkleTrees(dataList1, dataList2);
