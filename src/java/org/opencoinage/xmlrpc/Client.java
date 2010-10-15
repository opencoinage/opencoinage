package org.opencoinage.xmlrpc;
import org.opencoinage.*;

import java.math.BigInteger;
import java.net.URL;
import java.net.MalformedURLException;
import java.util.Map;

/**
 * An OpenCoinage XML-RPC API client.
 *
 * @see http://opencoinage.org/api/xmlrpc
 */
public class Client {
  /**
   * @param url a valid URL specifying the XML-RPC endpoint
   */
  public Client(final URL url) {
    this.url = url;
  }

  /**
   * @param url a valid URL specifying the XML-RPC endpoint
   * @throws MalformedURLException if <code>url</code> specifies an unknown protocol
   */
  public Client(final String url) throws MalformedURLException {
    this(new URL(url));
  }

  /**
   * The URL for the XML-RPC endpoint.
   *
   * @see java.net.URL
   */
  public final URL url;

  /**
   * Returns the server's version number.
   *
   * @return an "x.y.z" version number string
   * @see    http://opencoinage.org/api/xmlrpc#version
   */
  public String version() {
    return "0.0.1"; // FIXME
  }

  /**
   * Returns <code>true</code> if the given <code>token</code> is valid,
   * <code>false</code> otherwise.
   *
   * @param  token the token to verify
   * @return <code>true</code> or <code>false</code>
   * @see    http://opencoinage.org/api/xmlrpc#verify
   */
  public boolean verify(Token token) {
    return false; // TODO
  }

  /**
   * Returns information about the given <code>token</code>.
   *
   * @param  token the token to describe
   * @return a key-value mapping describing the token
   * @see    http://opencoinage.org/api/xmlrpc#describe
   */
  public Map<String, ?> describe(Token token) {
    return null; // TODO
  }

  /**
   * Issues a new token equivalent to the given <code>token</code>.
   *
   * @param  token the valid token to reissue
   * @return a new token
   * @see    http://opencoinage.org/api/xmlrpc#reissue
   */
  public Token reissue(Token token) {
    return reissue(token, null);
  }

  /**
   * Issues a new token equivalent to the given <code>token</code>.
   *
   * @param  token the valid token to reissue
   * @param  identifier a unique identifier for the new token
   * @return a new token
   * @see    http://opencoinage.org/api/xmlrpc#reissue
   */
  public Token reissue(Token token, BigInteger identifier) {
    return null; // TODO
  }
}
