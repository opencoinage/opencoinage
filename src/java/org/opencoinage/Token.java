package org.opencoinage;

import java.math.BigInteger;

/**
 * A digital currency token.
 */
public class Token {
  public static final String RDF_TYPE = Vocabulary.BASE + "Token";

  /**
   * The token's unique identifier.
   */
  public BigInteger identifier;

  /**
   * The issuer's digital signature.
   */
  public BigInteger signature;

  /**
   * @param identifier a unique token identifier of arbitrary length
   * @param signature  the issuer's digital signature
   */
  public Token(BigInteger identifier, BigInteger signature) {
    this.identifier = identifier;
    this.signature  = signature;
  }

  /**
   * @param identifier a unique token identifier of arbitrary length
   */
  public Token(BigInteger identifier) {
    this(identifier, null);
  }

  /**
   * Returns <code>true</code> if this token contains a digital signature,
   * <code>false</code> otherwise.
   *
   * @return true if the token is digitally signed, false otherwise
   */
  public boolean isSigned() {
    return this.signature != null;
  }

  /**
   * Returns the integer representation of this token.
   *
   * @return the token identifier
   */
  public BigInteger toInteger() {
    return this.identifier;
  }

  /**
   * Returns the string representation of this token.
   *
   * @return a Base62 string
   */
  @Override
  public String toString() {
    return super.toString(); // TODO
  }

  /**
   * Returns the array representation of this token.
   *
   * @return a two-element array containing the identifier and signature
   */
  public BigInteger[] toArray() {
    return new BigInteger[] { this.identifier, this.signature };
  }
}
