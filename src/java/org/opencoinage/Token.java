package org.opencoinage;

import java.math.BigInteger;
import java.util.Map;

/**
 * A digital currency token.
 */
public class Token {
  public static final String RDF_TYPE = Vocabulary.BASE + "Token";

  /**
   * The token's unique identifier.
   */
  public final BigInteger identifier;

  /**
   * The issuer's digital signature.
   */
  public BigInteger signature;

  /**
   * @param identifier a unique token identifier of arbitrary length
   * @param signature  the issuer's digital signature
   */
  public Token(final BigInteger identifier, final BigInteger signature) {
    this.identifier = identifier;
    this.signature  = signature;
  }

  /**
   * @param identifier a unique token identifier of arbitrary length
   */
  public Token(final BigInteger identifier) {
    this(identifier, null);
  }

  /**
   * @param identifier a unique token identifier
   */
  public Token(final long identifier, final long signature) {
    this(BigInteger.valueOf(identifier), BigInteger.valueOf(signature));
  }

  /**
   * @param identifier a unique token identifier
   * @param signature  the issuer's digital signature
   */
  public Token(final long identifier) {
    this(BigInteger.valueOf(identifier), null);
  }

  /**
   * @param options key-value mappings for fields
   * @throws NullPointerException
   *   if <code>options</code> is null
   * @throws IllegalArgumentException
   *   if <code>options</code> does not contain an "identifier" key
   */
  public Token(final Map<String, ?> options) {
    if (options == null) {
      throw new NullPointerException("options must not be null");
    }
    if (!options.containsKey("identifier")) {
      throw new IllegalArgumentException("options must contain the key 'identifier'");
    }
    else {
      this.identifier = (BigInteger)options.get("identifier");
    }
    if (options.containsKey("signature")) {
      this.signature = (BigInteger)options.get("signature");
    }
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
