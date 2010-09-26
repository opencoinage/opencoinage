package org.opencoinage;

import java.net.URI;
import java.net.URISyntaxException;

/**
 * A digital currency contract.
 */
public class Currency {
  public static final String RDF_TYPE = Vocabulary.BASE + "Currency";

  /**
   * The URI identifying this currency.
   *
   * @see java.net.URI
   */
  public final URI uri;

  /**
   * The issuer of this currency.
   */
  public Issuer issuer;

  /**
   * @param uri a valid URI identifying the currency
   * @throws URISyntaxException if <code>uri</code> is not a valid URI
   */
  public Currency(final String uri) throws URISyntaxException {
    this.uri = new URI(uri);
  }

  /**
   * @param uri a valid URI identifying the currency
   */
  public Currency(final URI uri) {
    this.uri = uri;
  }
}
