pragma solidity 0.4.25;

contract Aposta {
	
    string public nome;
    address public vencedor;
    address public apostador1;
    address public apostador2;
    address public mediador;
    
    modifier somenteMediador() {
        require(msg.sender==mediador, "Somente mediador pode realizar essa operação");
        _;
    }
	
    modifier somenteApostador1() {
        require(msg.sender==apostador1, "Somente apostador_1 pode realizar essa operação");
        _;
    }
    
    modifier somenteApostador2() {
        require(msg.sender==apostador2, "Somente apostador_2 pode realizar essa operação");
        _;
    }
    
     constructor() public {
        mediador = msg.sender;
    }
    
    function definirNomeDaAposta(string _nome) public somenteMediador {
        nome = _nome;
    }
    
    function definirApostador1(address _apostador1) public somenteMediador {
    	apostador1 = _apostador1;
    }
    
    function definirApostador2(address _apostador2) public somenteMediador {
    	apostador2 = _apostador2;
    }
    
    function depositar() public payable {
        
    }
    
    function definirVencedor(address _vencedor) public somenteMediador {
        vencedor = _vencedor;
    }
    
    function pagar() public {
        if (vencedor == apostador1) {
            apostador1.transfer((address(this).balance * 90) / 100);
            mediador.transfer((address(this).balance * 10) / 100);
        } else if (vencedor == apostador2) {
            apostador2.transfer((address(this).balance * 90) / 100);
            mediador.transfer((address(this).balance * 10) / 100);
        }
    }
}
