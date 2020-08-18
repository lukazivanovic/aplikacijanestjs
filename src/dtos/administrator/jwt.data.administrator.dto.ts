export class JwtDataAdministratorDto {
    administratorid: number;
    username: string;
    exp: number; // UNIX TIMESTAMP
    ip: string;
    ua: string;

    toPlainObject() {
        return {
            administratorid: this.administratorid,
            username: this.username,
            exp: this.exp,
            ip: this.ip,
            ua: this.ua
        }
    }
}