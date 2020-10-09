package javafxmvc.controller;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import javafxmvc.model.domain.Categoria;

public class FXMLAnchorPaneCadastrosCategoriasDialogController implements Initializable {
    @FXML
    private TextField textFieldCategoriaDescricao;

    @FXML
    private Button buttonConfirmar;

    @FXML
    private Button buttonCancelar;
    
    private Stage dialogStage;
    private boolean buttonConfirmarClicked = false;
    private Categoria categoria;    

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    

    public Stage getDialogStage() {
        return dialogStage;
    }

    public void setDialogStage(Stage dialogStage) {
        this.dialogStage = dialogStage;
    }

    public boolean isButtonConfirmarClicked() {
        return buttonConfirmarClicked;
    }

    public void setButtonConfirmarClicked(boolean buttonConfirmarClicked) {
        this.buttonConfirmarClicked = buttonConfirmarClicked;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
        textFieldCategoriaDescricao.setText(categoria.getDescricao());
    }
    
    @FXML
    private void handleButtonConfirmar() {
        if (validarEntradaDeDados()) {
            categoria.setDescricao(textFieldCategoriaDescricao.getText());
        
            buttonConfirmarClicked = true;
            dialogStage.close();
        }
    }
    
    @FXML
    private void handleButtonCancelar() {
        dialogStage.close();
    }    
    
    private boolean validarEntradaDeDados() {
        String errorMessage = "";
        
        if (textFieldCategoriaDescricao.getText() == null || textFieldCategoriaDescricao.getText().isEmpty()) {
            errorMessage += "Descrição inválida!\n";
        }

        if (errorMessage.length() == 0) {
            return true;
        } else {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Erro no cadastro");
            alert.setHeaderText("Campos inválidos, por favor corrija...");
            alert.setContentText(errorMessage);
            alert.show();
            return false;
        }
    }    
}
