# Gomplate Test Compose

## Project Structure

- `app/` - sample application with Dockerfile
- `datasources/` - template variable substitution data comes from here
- `template/` - Gomplate template for docker-compose
- `render-vault.sh` - Script to render template using Vault and config.json

## Install gomplate

https://docs.gomplate.ca/installing/

Probably npm is easiest, or just download the self contained binary, see in [github action ](https://github.com/vkhobor/gomplate_test_compose/blob/c40aba57d6821cfd19ba2f5bca44efc47c7f7950/.github/workflows/test-render-vault.yml#L26)
## How to Try

1. Start Vault with preseeded secrets:

   ```
   cd datasources
   docker compose up
   ```

2. The Vault container automatically seeds these secrets:
   - `secret/app/password` = "vault-password"
   - `secret/app/api_key` = "vault-api-key"
   - `secret/app/app_env` = "production"

3. Run the render script (uses Vault secrets + config.json datasource):

   ```
   ./render-vault.sh
   ```

4. Check the output file:
   ```
   cat docker-compose-vault.out.yml
   ```
