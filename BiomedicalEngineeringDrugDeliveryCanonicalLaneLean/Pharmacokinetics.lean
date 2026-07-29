import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiomedicalEngineeringDrugDeliveryCanonicalLaneLean

structure PharmacokineticParameterPackage where
  bioavailability : Prop
  clearance : Prop
  halfLife : Prop
  areaUnderCurve : Prop
  peakConcentration : Prop
  timeToPeak : Prop

structure PharmacokineticParameterEvidence (P : PharmacokineticParameterPackage) where
  bioavailabilityClosed : P.bioavailability
  clearanceClosed : P.clearance
  halfLifeClosed : P.halfLife
  areaUnderCurveClosed : P.areaUnderCurve
  peakConcentrationClosed : P.peakConcentration
  timeToPeakClosed : P.timeToPeak

def PharmacokineticParameterClosed (P : PharmacokineticParameterPackage) : Prop :=
  P.bioavailability ∧
  P.clearance ∧
  P.halfLife ∧
  P.areaUnderCurve ∧
  P.peakConcentration ∧
  P.timeToPeak

theorem pharmacokinetic_parameter_closed_from_evidence (P : PharmacokineticParameterPackage) (E : PharmacokineticParameterEvidence P) :
    PharmacokineticParameterClosed P := by
  exact And.intro E.bioavailabilityClosed
    (And.intro E.clearanceClosed
      (And.intro E.halfLifeClosed
        (And.intro E.areaUnderCurveClosed
          (And.intro E.peakConcentrationClosed E.timeToPeakClosed))))

end BiomedicalEngineeringDrugDeliveryCanonicalLaneLean
end HautevilleHouse
