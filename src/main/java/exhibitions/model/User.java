package exhibitions.model;

public class User {
    private int id;
    private String email;
    private String password;
    private ROLE role;

    public ROLE getRole() {
        return role;
    }

    public void setRole(ROLE role) {
        this.role = role;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", role=" + role +
                '}';
    }

    public enum ROLE {
        ADMIN("Admin"), USER("User");

        private String role;

        public String getRole() {
            return role;
        }

        ROLE(String role) {
            this.role = role;
        }

        public boolean isUser() {
            return this == USER;
        }

        public boolean isAdmin() {
            return this == ADMIN;
        }
    }
}