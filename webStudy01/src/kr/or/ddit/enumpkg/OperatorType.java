package kr.or.ddit.enumpkg;

import kr.or.ddit.servlet01.Operator;

public enum OperatorType {

	PLUS("+", new Operator() {

		@Override
		public long operate(int leftOp, int rightOp) {
			// TODO Auto-generated method stub
			return leftOp + rightOp;
		}
		
	}),
	MINUS("-", (leftOp, rightOp)->{return leftOp - rightOp;}),
	MULTIPLY("*", (leftOp, rightOp)->{return leftOp * rightOp;}),
	DIVIDE("/", (leftOp, rightOp)->{return leftOp / rightOp;});
	
	private Operator operator;
	private String sign;
	private static final String PATTERN = "%d %s %d = %d";

	private OperatorType(String sign, Operator operator) {
		this.operator = operator;
		this.sign = sign;
	}
	
	public long operate(int leftOp, int rightOp) {
		return operator.operate(leftOp, rightOp);
	}
	
	public String operateToExpression(int leftOp, int rightOp) {
		return String.format(PATTERN, leftOp, sign, rightOp, operate(leftOp, rightOp));
	}

}
