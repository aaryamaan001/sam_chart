import 'dart:convert';
import 'dart:io';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class BlockchainHelper {
  final String rpcUrl = "http://127.0.0.1:7545";
  final String privateKey =
      "0x6a67d5d4e0eeaa2c27f99210a6935f3b5b94ab1ef8800eaa7f59def50c590156";

  late Web3Client client;
  late EthereumAddress contractAddress;
  late DeployedContract contract;
  late Credentials credentials;

  BlockchainHelper(String abiPath, String contractAddr) {
    client = Web3Client(rpcUrl, Client());
    credentials = EthPrivateKey.fromHex(privateKey);
    contractAddress = EthereumAddress.fromHex(contractAddr);

    final abi = jsonDecode(File(abiPath).readAsStringSync());
    contract = DeployedContract(
        ContractAbi.fromJson(jsonEncode(abi), "ChildData"), contractAddress);
  }

  Future<void> addChild(
      String name, int weightOnAdmission, int weightOnDischarge) async {
    final addChildFunction = contract.function("addChild");
    await client.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: addChildFunction,
        parameters: [
          name,
          BigInt.from(weightOnAdmission),
          BigInt.from(weightOnDischarge)
        ],
      ),
    );
  }

  Future<List<dynamic>> getChild(int index) async {
    final getChildFunction = contract.function("getChild");
    return await client.call(
      contract: contract,
      function: getChildFunction,
      params: [BigInt.from(index)],
    );
  }
}
