package blockChain;

import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class Blockchain 
{
	 private List<Block> chain;
	    private Connection connection;

	    public Blockchain() {
	        chain = new ArrayList();
	        // Create genesis block
	        chain.add(createGenesisBlock());

	        // Establish database connection
	        try {
	            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork", "root", "root");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    private Block createGenesisBlock() {
	        return new Block(0, System.currentTimeMillis(), "Genesis Block", "0");
	    }

	    public void addBlock(String data) {
	        Block latestBlock = chain.get(chain.size() - 1);
	        Block newBlock = new Block(chain.size(), System.currentTimeMillis(), data, latestBlock.getHash());
	        chain.add(newBlock);

	        // Insert block into database
	        try {
	            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO blockchain (`index`, `timestamp`, `data`, `previousHash`, `hash`) VALUES (?, ?, ?, ?, ?)");
	            preparedStatement.setInt(1, newBlock.index);
	            preparedStatement.setLong(2, newBlock.timestamp);
	            preparedStatement.setString(3, newBlock.data);
	            preparedStatement.setString(4, newBlock.previousHash);
	            preparedStatement.setString(5, newBlock.hash);
	            preparedStatement.executeUpdate();
	            
	            System.out.println("\n\n\\n\\n**** Data Entered into BlockChain******");
	            System.out.println("****The Blockchain Vault!****");
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    
	     public boolean isChainValid() {
	        for (int i = 1; i < chain.size(); i++) {
	            Block currentBlock = chain.get(i);
	            Block previousBlock = chain.get(i - 1);
	            if (!currentBlock.getHash().equals(currentBlock.calculateHash())) {
	                return false; // Hash mismatch
	            }
	            if (!currentBlock.getPreviousHash().equals(previousBlock.getHash())) {
	                return false; // Previous hash mismatch
	            }
	        }
	        return true;
	    }
}
