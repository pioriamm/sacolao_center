import 'dart:convert' as json;

import 'package:http/http.dart' as http;
import 'package:sacolao_center/pagamentos.dart';

class PagamentosConfirmados {
  Pagamentos pg = Pagamentos();
  var cabecalhos = {
    //'Authorization': 'a20b386d-a6b1-4d3f-8864-37124998e8a4',
    'Authorization': '939c2ae8-c27a-4fcc-bc1f-afbe63a8cfb0',
    'Content-type': 'application/json',
  };
  var url = Uri.parse(
      'https://api.conciliadora.com.br/api/ConsultaPagamento?\$filter=DataPagamento ge 2024-06-26T00:00Z '
      'and DataPagamento lt 2024-07-01T23:59Z');

  Future<List<Pagamentos>> getPayments() async {
    var response = await http.get(url, headers: cabecalhos);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.jsonDecode(response.body)['value'];
      return jsonResponse
          .map((dynamic json) => Pagamentos.fromJson(json))
          .toList();
    } else {
      throw Exception('Falha ao carregar os pagamentos');
    }
  }

  List<Map<String, dynamic>> groupbyPagamentos(List<Pagamentos> lista) {
    List<Map<String, dynamic>> agrupado = [];
    Map<String, Map<String, dynamic>> mapAgrupado = {};

    for (var element in lista) {
      String chave = '${element.empresa}-${element.conta}-${element.produto}';

      if (mapAgrupado.containsKey(chave)) {
        // Se a chave já existir, somar o valorLiquido ao valor existente
        mapAgrupado[chave]?['Liquido'] += element.valorLiquido!;
      } else {
        // Se a chave não existir, criar uma nova entrada no Map
        mapAgrupado[chave] = {
          "Empresa": element.empresa,
          "Domicilio": element.conta,
          "Produtod": element.produto,
          "Liquido": element.valorLiquido!
        };
      }
    }
// Converter o Map de volta para uma lista
    mapAgrupado.forEach((key, value) {
      value['Liquido'] = (value['Liquido'] as double);
      agrupado.add(value);
    });

    // Converter o Map de volta para uma lista
    agrupado = mapAgrupado.values.toList();

    return agrupado;
  }
}
