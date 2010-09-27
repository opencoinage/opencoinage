package org.opencoinage;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

/**
 * A digital currency issuer.
 */
public class Issuer {
  public static final String RDF_TYPE = Vocabulary.BASE + "Issuer";

  /**
   * The URI identifying this issuer.
   *
   * @see java.net.URI
   */
  public final URI uri;

  /**
   * The name of this issuer.
   *
   * @see http://xmlns.com/foaf/spec/#term_name
   */
  public String name;

  /**
   * @param uri a valid URI identifying the issuer
   */
  public Issuer(final URI uri) {
    this.uri = uri;
  }

  /**
   * @param uri a valid URI identifying the issuer
   * @param options key-value mappings for fields
   */
  public Issuer(final URI uri, final Map<String, ?> options) {
    this.uri = uri;
    if (options != null) {
      if (options.containsKey("name")) {
        this.name = (String)options.get("name");
      }
    }
  }

  /**
   * @param uri a valid URI identifying the issuer
   * @throws URISyntaxException if <code>uri</code> is not a valid URI
   */
  public Issuer(final String uri) throws URISyntaxException {
    this(new URI(uri));
  }

  /**
   * @param uri a valid URI identifying the issuer
   * @param options key-value mappings for fields
   * @throws URISyntaxException if <code>uri</code> is not a valid URI
   */
  public Issuer(final String uri, final Map<String, ?> options) throws URISyntaxException {
    this(new URI(uri), options);
  }
}
