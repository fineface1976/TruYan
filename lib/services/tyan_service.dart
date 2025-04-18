 Future<void> setReferrer(String referrerAddress) async {
  final client = Web3Client(bscNode, Client());
  final contract = DeployedContract(
    ContractAbi.fromJson(tyanABI, 'TYAN'),
    EthereumAddress.fromHex(contractAddress),
  );
  await client.sendTransaction(
    credentials,
    Transaction.callContract(
      contract: contract,
      function: contract.function('setReferrer'),
      parameters: [yourWalletAddress, EthereumAddress.fromHex(referrerAddress)],
    ),
  );
}
