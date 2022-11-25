void main() {
  const urlPrincipal =
      "http://www.scielo.org.co/scielo.php?script=sci_arttext&pid=S0120-87052020000200169";
  final urlFinal = Uri.parse(urlPrincipal);
  print(urlFinal.origin);
  print(urlFinal.scheme);
  print(urlFinal.port);
  print(urlFinal.queryParameters);
}
