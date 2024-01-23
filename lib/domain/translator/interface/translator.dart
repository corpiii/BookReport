abstract interface class Translator<From, To> {
  To translateTo(From data);
  From translateFrom(To data);
}