library ieee;
use ieee.std_logic_1164.all;

entity firstproject is
	generic (fclk: integer :=10000000);
	port ( clk, rst, ena,chave: in std_logic;
			full_count: out std_logic;
			dig1, dig2, dig3, dig4: out std_logic_vector(6 downto 0));
end firstproject;

architecture firstproject of firstproject is

--		component Multiplexer					
--			port(inp1, inp2: in std_logic_vector(6 downto 0);
--					sel : in std_logic;
--					outp : out std_logic_vector(6 downto 0));			
--		end component;	
begin 
--	Full Adder                       			 inp1        inp2    sel     
--			fa0:	multiplexer	  PORT MAP(      ,      ,      ,        ,       ;
--			fa1:	multiplexer   PORT MAP(      ,      ,      ,       ,       ;	
			
		process(clk, rst, ena)
			variable count0: integer range 0 to fclk;
			variable count1: integer range 0 to 10;  --unidade minutos
			variable count2: integer range 0 to 7;   --dezena minutos
			variable count3: integer range 0 to 10;  --unidade horas
			variable count4: integer range 0 to 7;   --unidade horas
			variable count5: integer range 0 to 10;   --contagem de ciclos
			variable count6: integer range 0 to 10;
			variable count7: integer range 0 to 3;
			variable aux: integer range 0 to 4;
		begin
			if(rst='1') then
				aux:=0;
				count0:= 0;
				count1:= 0;
				count2:= 0;
				count3:= 0;
				count4:= 0;
				count5:= 0;
				count6:=0;
				count7:=0;
				full_count <= '0';
			elsif(aux=3 and count7=2) then
				aux:=0;
				count5:=0;
				count6:=0;
				count7:=0;
			elsif(clk'event and clk='1') then 
				if(ena='1') then
					count0 := count0 + 1;
					if(count0 = fclk) then
						count0:= 0;
						count1:= count1+1;   --unidade de 1
						if(count1=10) then
							count1:=0;
							count2:=count2+1; --dezena de 2
							if(count2=6) then
								count2:= 0;  
								count3:= count3+1;  --unidade de horas
								if(count3=10) then 
									count3 := 0;
									count4 :=count4+1;
									if(count4=6) then
										count4:=0;
										count5:= count5+1;
										if(count5=4) then
											aux:=aux+1;
										end if;
										if(count5=10) then
											count5:=0;
											count6:=count6+1;
											count7:=count7+1;
										end if;
									end if;
								end if;
							end if;
						end if;
					end if;
				end if;
			end if;
	---------ssd drivers------------no------
	if(chave = '1') then
		CASE count1 is
			WHEN 0 => dig1 <= "1000000"; --126
			WHEN 1 => dig1 <= "1111001"; --48
			WHEN 2 => dig1 <= "0100100"; --109
			WHEN 3 => dig1 <= "0110000"; --121
			WHEN 4 => dig1 <= "0011001"; --51
			WHEN 5 => dig1 <= "0010010"; --91
			WHEN 6 => dig1 <= "0000010"; --95
			WHEN 7 => dig1 <= "1111000"; --112
			WHEN 8 => dig1 <= "0000000"; --127
			WHEN 9 => dig1 <= "0010000"; --123
			WHEN OTHERS => dig1 <= "1111111"; --79 ("E")
		END CASE;
		CASE count2 is
			WHEN 0 => dig2 <= "1000000"; --126
			WHEN 1 => dig2 <= "1111001"; --48
			WHEN 2 => dig2 <= "0100100"; --109
			WHEN 3 => dig2 <= "0110000"; --121
			WHEN 4 => dig2 <= "0011001"; --51
			WHEN 5 => dig2 <= "0010010"; --91
			WHEN 6 => dig2 <= "0000010"; --95
			WHEN OTHERS => dig2 <= "1111111"; --79 ("E")
		END CASE;
		CASE count3 is
			WHEN 0 => dig3 <= "1000000"; --126
			WHEN 1 => dig3 <= "1111001"; --48
			WHEN 2 => dig3 <= "0100100"; --109
			WHEN 3 => dig3 <= "0110000"; --121
			WHEN 4 => dig3 <= "0011001"; --51
			WHEN 5 => dig3 <= "0010010"; --91
			WHEN 6 => dig3 <= "0000010"; --95
			WHEN 7 => dig3 <= "1111000"; --112
			WHEN 8 => dig3 <= "0000000"; --127
			WHEN 9 => dig3 <= "0010000"; --123
			WHEN OTHERS => dig3 <= "1111111"; --79 ("E")
		end case;
		CASE count4 is
			WHEN 0 => dig4 <= "1000000"; --126
			WHEN 1 => dig4 <= "1111001"; --48
			WHEN 2 => dig4 <= "0100100"; --109
			WHEN 3 => dig4 <= "0110000"; --121
			WHEN 4 => dig4 <= "0011001"; --51
			WHEN 5 => dig4 <= "0010010"; --91
			WHEN 6 => dig4 <= "0000010"; --95
			WHEN OTHERS => dig4 <= "1111111"; --79 ("E")
		end case;
	end if;
	if(chave='0') then
		CASE count3 is
			WHEN 0 => dig1 <= "1000000"; --126
			WHEN 1 => dig1 <= "1111001"; --48
			WHEN 2 => dig1 <= "0100100"; --109
			WHEN 3 => dig1 <= "0110000"; --121
			WHEN 4 => dig1 <= "0011001"; --51
			WHEN 5 => dig1 <= "0010010"; --91
			WHEN 6 => dig1 <= "0000010"; --95
			WHEN 7 => dig1 <= "1111000"; --112
			WHEN 8 => dig1 <= "0000000"; --127
			WHEN 9 => dig1 <= "0010000"; --123
			WHEN OTHERS => dig1 <= "1111111"; --79 ("E")
		END CASE;
		CASE count4 is
			WHEN 0 => dig2 <= "1000000"; --126
			WHEN 1 => dig2 <= "1111001"; --48
			WHEN 2 => dig2 <= "0100100"; --109
			WHEN 3 => dig2 <= "0110000"; --121
			WHEN 4 => dig2 <= "0011001"; --51
			WHEN 5 => dig2 <= "0010010"; --91
			WHEN 6 => dig2 <= "0000010"; --95
			WHEN OTHERS => dig2 <= "1111111"; --79 ("E")
		END CASE;
		CASE count5 is
			WHEN 0 => dig3 <= "1000000"; --126
			WHEN 1 => dig3 <= "1111001"; --48
			WHEN 2 => dig3 <= "0100100"; --109
			WHEN 3 => dig3 <= "0110000"; --121
			WHEN 4 => dig3 <= "0011001"; --51
			WHEN 5 => dig3 <= "0010010"; --91
			WHEN 6 => dig3 <= "0000010"; --95
			WHEN 7 => dig3 <= "1111000"; --112
			WHEN 8 => dig3 <= "0000000"; --127
			WHEN 9 => dig3 <= "0010000"; --123
			WHEN OTHERS => dig3 <= "1111111"; --79 ("E")
		end case;
		CASE count6 is
			WHEN 0 => dig4 <= "1000000"; --126
			WHEN 1 => dig4 <= "1111001"; --48
			WHEN 2 => dig4 <= "0100100"; --109
			WHEN OTHERS => dig4 <= "1111111"; --79 ("E")
		end case;
	end if;
	END PROCESS;
END firstproject;
