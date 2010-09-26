package org.opencoinage;

import java.net.URI;
import java.net.URISyntaxException;

/**
 * An RDFS vocabulary for digital currency issuance.
 *
 * @see http://opencoinage.org/rdf/
 */
public class Vocabulary {
  public static final String BASE       = "http://opencoinage.org/rdf/";
  public static final String AMOUNT     = BASE + "amount";
  public static final String EXPIRES    = BASE + "expires";
  public static final String IDENTIFIER = BASE + "identifier";
  public static final String ISSUER     = BASE + "issuer";
  public static final String SIGNATURE  = BASE + "signature";
}
