/**
 *
 * @author Ygor Oliveira | Yasmim Candelária | Juan Dias | Filipe Vital
 */
package Utils;

import at.favre.lib.crypto.bcrypt.BCrypt;


public class CryptoUtils {
    
    
    public static String gerarHash(String senhaAberta) {
        return BCrypt.withDefaults().hashToString(12, senhaAberta.toCharArray());
        
    }
    
    public static boolean validarSenha(String senhaAberta, String senhaFechada) {
         BCrypt.Result result = BCrypt.verifyer().verify(senhaAberta.toCharArray(), senhaFechada);
        return result.verified;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        String senha = "john12345";
        System.out.println("Hash = " + gerarHash(senha));
    }
}
