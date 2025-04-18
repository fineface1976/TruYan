const TYAN_ADDRESS = "YOUR_CONTRACT_ADDRESS"; // Replace after deployment
const TYAN_ABI = [...]; // Paste ABI from Remix after compiling

document.getElementById("connect").addEventListener("click", async () => {
  if (window.ethereum) {
    await window.ethereum.request({ method: "eth_requestAccounts" });
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    const userAddress = await signer.getAddress();
    alert("Connected: " + userAddress);
  } else {
    alert("Install MetaMask/Trust Wallet!");
  }
});

document.getElementById("register").addEventListener("click", async () => {
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  const signer = provider.getSigner();
  const contract = new ethers.Contract(TYAN_ADDRESS, TYAN_ABI, signer);
  await contract.register();
  alert("You received 100 TYAN!");
});
