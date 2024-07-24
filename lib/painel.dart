import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sacolao_center/fetch_data.dart';
import 'package:sacolao_center/pagamentos.dart';

class Painel extends StatefulWidget {
  const Painel({super.key});

  @override
  State<Painel> createState() => _PainelState();
}

class _PainelState extends State<Painel> {
  PagamentosConfirmados pg = PagamentosConfirmados();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: Image.asset("img/conciliadora.png"),
                  ),
                  const SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pagamentos Confirmados",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text("Agrupados por Empresa,Conta e Produto"),
                        Text("Data 2024-06-05"),
                      ],
                    ),
                  ),
                ],
              )),
          Expanded(
            child: FutureBuilder<List<Pagamentos>>(
              future: pg.getPayments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView.builder(
                      itemCount: pg.groupbyPagamentos(snapshot.data!).length,
                      itemBuilder: (c, i) {
                        var agrupadopor = pg.groupbyPagamentos(snapshot.data!);
                        var tamanho = 200.0;
                        return Column(
                          children: [
                            i == 0
                                ? Row(
                                    children: [
                                      SizedBox(
                                        width: tamanho,
                                        child: const Text(
                                          'Empresa',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      SizedBox(
                                        width: tamanho,
                                        child: const Text(
                                          'Domicílio Bancário',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      SizedBox(
                                        width: tamanho,
                                        child: const Text(
                                          'Produto',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      SizedBox(
                                        width: tamanho,
                                        child: const Text(
                                          'Liquido',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            Row(
                              children: [
                                SizedBox(
                                  width: tamanho,
                                  child: Text('${agrupadopor[i]["Empresa"]}'),
                                ),
                                SizedBox(
                                  width: tamanho,
                                  child: Text('${agrupadopor[i]["Domicilio"]}'),
                                ),
                                SizedBox(
                                  width: tamanho,
                                  child: Text('${agrupadopor[i]["Produtod"]}'),
                                ),
                                SizedBox(
                                  width: tamanho,
                                  child: Text(
                                      NumberFormat("R\$ #,##0.00", "pt_BR")
                                          .format(agrupadopor[i]["Liquido"])),

                                  //,
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
