export class JwtDataAdministratorDto {
    administratorid: number;
    username: string;
    ext: number; // UNIX TIMESTAMP
    ip: string;
    ua: string;

    toPlainObject() {
        return {
            administratorid: this.administratorid,
            username: this.username,
            ext: this.ext,
            ip: this.ip,
            ua: this.ua
        }
    }
}