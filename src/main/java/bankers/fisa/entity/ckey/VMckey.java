package bankers.fisa.entity.ckey;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@SuppressWarnings("serial")
public class VMckey implements Serializable{
	private int vm_number;
	private String vm_create_date;
	@Override
	public String toString() {
		return vm_number + "_" + vm_create_date;
	}
	
}
